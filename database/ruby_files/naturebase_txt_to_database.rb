require 'sqlite3'

def generate_formula(increase, decrease)
  string = ""

  string += "'+#{increase}-#{decrease}'"

  string = "null" if increase.eql? decrease

  string
end

database_location = '../pokemon_database.db'
db = SQLite3::Database.open database_location


file_location = '../text_files/natures.txt'
file = File.open (file_location)
file.each_line do |line|
  words = line.split(" ")
  name = "'#{words[0].downcase}'"
  formula = generate_formula words[1].downcase.tr('.', ''), words[2].downcase.tr('.', '')
  query = "insert into NatureBase (name, formula) values (#{name}, #{formula});"
  puts query
  db.execute query
end
file.close
