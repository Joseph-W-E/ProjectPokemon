require 'rubygems'
require 'sqlite3'
require 'ccsv'

puts 'Input file name:'
file = gets.chomp
puts 'Adding csv to database pokemon_database.db, table MoveBase...'

# Hard Code the columns in the MoveBase table
columns = %w(name type category power accuracy pp effect probability)

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

    vals = [
      "'#{values[0].downcase.gsub("'", "''")}'",
      "'#{values[1].downcase.gsub("'", "''")}'",
      "'#{values[2].downcase.tr('*', '').gsub("'", "''")}'",
      values[3].gsub('-', "null"),
      values[4].gsub(/[^0-9]/, "null").gsub("nullnullnull", "-1"),
      values[5].gsub(/[^0-9]/, "null"),
      (blank?(values[8]) ? (blank?(values[7]) ? "null" : "'#{values[7].gsub("'", "''")}'") : "'#{values[7].gsub("'", "''")}#{values[8].gsub("'", "''")}'").tr('"', ''),
      values[6].gsub(/[^0-9]/, "null")
    ]

    db.execute("insert into MoveBase (#{columnsAsString columns}) values (#{columnsAsString vals});")
    #puts "insert into MoveBase (#{columnsAsString columns}) values (#{columnsAsString vals});"

  end
end
