
# ProjectPokemon
Welcome to ProjectPokemon! This README is primarily for this project's plan. Note that this plan is not complete, and probably won't be complete for awhile.

# The Idea
The goal of this project is to bring old-school Pokemon to the modern world. Pokemon Go has done just that, but is *very* simple. That is, there's no trading, battling is garbage, and there's little rhyme or reason as to why certain Pokemon appear where they do. That is where ProjectPokemon comes in. This is just a project for fun, and absolutely NO money will be generated from it's existence.

ProjectPokemon exists as an Android app. The user pulls open the app and see's what looks like the Gameboy SP style Pokedex. On the top half, the user sees a map. This is where the user is currently standing in the world. On the bottom half, the user sees a "hub". In this hub, the user can navigate through multiple spaces like: My Pokemon, My Team, My Items, etc... None of this means much without battling, though. Battling occurs in two ways: encountering a wild Pokemon, or challenging a user (whether in Person or at a gym). This battling will look a lot like Gen IV battling, just with worse animations. The gym is still an idea in progress and will come later. Besides battling, there is trading. You can trade Pokemon with anyone *in person*. There are two important reasons for this: account safety and making the game hard. The game wouldn't be fun if you could just get any Pokemon from whoever. With trading required to be in person, there's little incentive to hack someones account. It also makes "exotic" Pokemon a thrill to get.

# The Plan
## Step 1 - The database.
#### Part A - Learn Sqlite.
I'm still not 100% sure why I chose Sqlite, but I did.
#### Part A - Create the PokemonBase table.
This is the table that will hold all static information about the Pokemon.
#### Part B - Create the MoveBase table.
This is the table that will hold all static information about the Moves.
#### Part C - Create the ItemBase table.
This is the table that will hold all static information about the Items.

## Step 2 - The Web Server.
#### Part A - Create a running web server on local host.
This web server will be implemented with Ruby/Sinatra. Ruby/Sinatra was picked for its simplicity. It's easy to use, easy to learn, and easy to modify.
#### Part B - Add the database to the web server.
Using the sqlite3 gem, add sqlite functionality to the web server.
#### Part C - Design the schema for holding User information.
For users to trade and battle one another, there needs to be a system for storing log-in information. The schema should involve parameters like id, email, password, username, pokemon_in_cpu, pokemon_in_team, items.
#### Part D - Verify that sqlite3 is holding all the necessary tables.
The tables MongoDB should be holding are:
 - PokemonBase: id, name, pokedex_entry, percent_male, primary_type, secondary_type, learn_set, tm_set, ability_set, lvls_up_at, lvls_up_to, locations, sprites
 - MoveBase: id, name, pp, power, accuracy, type, contact_type, tm_id, recharge, delayed, lingering, trapping, causes_effects, targets_self, animation
 - ItemBase: id, name, image
 - Users: id, email, username, password, pokemon_in_cpu, pokemon_in_team, items_owned

## Step 3 - The Android Application.
#### Part A - Create a basic android application.
This is the main application. The goal of this step is to just get it created. It will have a minimum Android version of 6.0.
#### Part B - Implement the ability to get the user's latitude and longitude every ~20 seconds.
This is the bread and butter of the app. Verify that you can ping lat/long every so often.
#### Part C - Verify that data can be pulled from / sent to the Web Server.
Connect to the web server and request data based off the lat/long.
