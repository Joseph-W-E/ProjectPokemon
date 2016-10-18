require 'sinatra'
require 'sqlite3'
require 'json'

set :bind, '10.26.69.83'

# File locations
database_location  = "../database/pokemon_database.db"

# Constants
base_api_url = '/api'

# Helper methods
def generate_hash_ability_base(arr)
  abilities_base_columns = %w(id name description generation)
  return_array = []
  arr.each do |subarr|
    hash = Hash.new
    subarr.each_with_index do |element, index|
      hash[abilities_base_columns[index]] = element
    end
    return_array.push hash
  end
  return return_array
end

def generate_hash_move_base(arr)
  moves_base_columns = %w(id name type category power accuracy pp effect probability)
  return_array = []
  arr.each do |subarr|
    hash = Hash.new
    subarr.each_with_index do |element, index|
      hash[moves_base_columns[index]] = element
    end
    return_array.push hash
  end
  return return_array
end

def generate_hash_pokemon_base(arr)
  pokemon_base_columns = %w(id national_number name primary_type secondary_type percent_male growth_rate evolves_at evolves_into hp_base attack_base defense_base spatt_base spdef_base speed_base)
  return_array = []
  arr.each do |subarr|
    hash = Hash.new
    subarr.each_with_index do |element, index|
      hash[pokemon_base_columns[index]] = element
    end
    return_array.push hash
  end
  return return_array
end

# Open the database
db = SQLite3::Database.open database_location

#********** GET REQUESTS **********#
# ABILITIES
get "#{base_api_url}/get/abilities" do

  abilities = db.execute "select * from AbilityBase;"
  JSON.pretty_generate generate_hash_ability_base abilities

end
# MOVES
get "#{base_api_url}/get/moves" do

  moves = db.execute "select * from MoveBase;"
  JSON.pretty_generate generate_hash_move_base moves

end
# POKEMON
get "#{base_api_url}/get/pokemon" do

  pokemon = db.execute "select * from PokemonBase"
  JSON.pretty_generate generate_hash_pokemon_base pokemon

end
# USERS
get "#{base_api_url}/get/users" do

  'users'

end

#********** POST REQUESTS **********#

#********** PUT REQUESTS **********#

#********** DELETE REQUESTS **********#
