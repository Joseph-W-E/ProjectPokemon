require 'rubygems'
require 'sqlite3'
require 'ccsv'

puts 'Input file name:'
file = gets.chomp
puts 'Adding csv to database pokemon_database.db, table AbilityBase...'

# Hard Code the columns in the MoveBase table
columns = %w(name description generation)

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

# Determine if the column item is blank
def blank?(val)
  return val.nil? || val.empty?
end

# Open the database
db = SQLite3::Database.open "pokemon_database.db"

# Open the CSV
#db.execute("insert into MoveBase (#{columnsAsString(columns)}) values ('name', 'type', 'category', 50, 100, 5, 'effect', 0)")

# name, type, category, power, acc, pp, probability, effect
first = true
Ccsv.foreach(file) do |values|
  if first
    first = false
  else

    name = values[0].downcase
    generation = values[1]
    description1 = values[2].gsub("'", "''").gsub(/[^A-z^ ^.^,^-]/, '')
    description2 = values[3].gsub("'", "''").gsub(/[^A-z^ ^.^,^-]/, '') unless values[3].nil?
    description = "#{description1}#{description2}"

    vals = [
      "'#{name}'",
      "'#{description}'",
      generation
    ]

    puts "Trying to add #{description}..."
    db.execute("insert into AbilityBase (#{columnsAsString columns}) values (#{columnsAsString vals});")
    puts "Successfully added #{description}!"
    #puts "insert into AbilityBase (#{columnsAsString columns}) values (#{columnsAsString vals});"
  end
end
