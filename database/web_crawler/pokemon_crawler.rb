require 'rubygems'
require 'json'
require 'nokogiri'
require 'ccsv'
require 'open-uri'
require 'sqlite3'

# Get the complete list of pokemon
list_of_pokemon = []
csv_file = 'pokemon.csv'
first = true
Ccsv.foreach(csv_file) do |values|
  if first
    first = false
  else
    list_of_pokemon.push(values[0]) unless values[0].include? "\""
  end
end

# Develop an easy way to get the columns as a string
def columnsAsString(cols)
  string = ""
  first = true
  cols.each do |col|
    if first
      string += col
      first = false
    else
      string += ", #{col}"
    end
  end
  string
end

# Develop an easy way to get the hash as a string
def hashAsString(hash)
  string = ""
  first = true
  hash.map do |k, v|
    if v.is_a?(Numeric) || v.include?(".") || v.include?("null")
      v = v.nil? ? 'null' : v
    else
      v = (v.nil? || v.empty?) ? 'null' : v
    end
    if first
      if v.is_a?(Numeric) || v.include?(".") || v.include?("null")
        string += "#{v}"
      else
        string += "'#{v}'"
      end
      first = false
    else
      if v.is_a?(Numeric) || v.include?(".") || v.include?("null")
        string += ", #{v}"
      else
        string += ", '#{v}'"
      end
    end
  end
  string
end

# Determine if the column item is blank
def blank?(val)
  return val.nil? || val.empty?
end

# Define the methods used to clean up the input from the web crawling
def clean_national_number(input)
  input.match('[0-9]+')[0].to_i
end
def clean_name(input)
  input.downcase
end
def clean_primary_type(input)
  input.downcase!
  matches = input.scan(/[a-z]+/)
  matches[0]
end
def clean_secondary_type(input)
  input.downcase!
  matches = input.scan(/[a-z]+/)
  if matches[1].nil? || matches[1] == 'null'
    return ''
  else
    return matches[1]
  end
end
def clean_percent_male(input)
  input.match('[0-9.]+')[0]
end
def clean_growth_rate(input)
  input.downcase!
  case (input)
  when 'slow'
    return 0
  when 'medium slow'
    return 10
  when 'medium fast'
    return 20
  when 'fast'
    return 30
  when 'erratic'
    return 40
  else
    return 0
  end
end
def clean_evolves_at(input)
  ''
end
def clean_evolves_into(input)
  #types = %w(normal fire fighting water flying grass poison electric ground psychic rock ice bug dragon ghost dark steel fairy ???)
  ''
end
def clean_hp_base(input)
  input.match('[0-9]+')[0].to_i
end
def clean_attack_base(input)
  input.match('[0-9]+')[0].to_i
end
def clean_defense_base(input)
  input.match('[0-9]+')[0].to_i
end
def clean_spatt_base(input)
  input.match('[0-9]+')[0].to_i
end
def clean_spdef_base(input)
  input.match('[0-9]+')[0].to_i
end
def clean_speed_base(input)
  input.match('[0-9]+')[0].to_i
end
def extract_data(html)
  data = Hash.new
  data[:national_number] = clean_national_number (html.css("td")[0].text)
  data[:name]            = clean_name            (html.css("h1").text)
  data[:primary_type]    = clean_primary_type    (html.css("td")[1].text)
  data[:secondary_type]  = clean_secondary_type  (html.css("td")[1].text)
  data[:percent_male]    = clean_percent_male    (html.css("td")[14].text)
  data[:growth_rate]     = clean_growth_rate     (html.css("td")[12].text)
  data[:evolves_at]      = ''
  data[:evolves_into]    = ''
  data[:hp_base]         = clean_hp_base         (html.css("td")[17].text)
  data[:attack_base]     = clean_attack_base     (html.css("td")[21].text)
  data[:defense_base]    = clean_defense_base    (html.css("td")[25].text)
  data[:spatt_base]      = clean_spatt_base      (html.css("td")[29].text)
  data[:spdef_base]      = clean_spdef_base      (html.css("td")[33].text)
  data[:speed_base]      = clean_speed_base      (html.css("td")[37].text)
  data
end

# Setup the database
db = SQLite3::Database.open "pokemon_database.db"
columns = %w(national_number name primary_type secondary_type percent_male growth_rate evolves_at evolves_into hp_base attack_base defense_base spatt_base spdef_base speed_base)

query_file = File.new("queries.txt", "w")
error_file = File.new("errors.txt", "w")

# For each of the pokemon in the list, crawl the web!
list_of_pokemon.each do |pokemon|
  begin
    html = Nokogiri::HTML(open("http://pokemondb.net/pokedex/#{pokemon.downcase}/"))
    query = "insert into PokemonBase (#{columnsAsString columns}) values (#{hashAsString extract_data html});"

    puts query
    query_file.puts query
    db.execute query

  rescue Exception
    puts "Error encountered..."
    error_file.puts query
  end

  sleep 2
end
