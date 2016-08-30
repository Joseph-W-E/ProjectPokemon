
# ProjectPokemon
Welcome to ProjectPokemon! This README is primarily for this project's plan. Note that this plan is not complete, and probably won't be complete for awhile.

# The Idea
The goal of this project is to bring old-school Pokemon to the modern world. Pokemon Go has done just that, but is *very* simple. That is, there's no trading, battling is garbage, and there's little rhyme or reason as to why certain Pokemon appear where they do. That is where ProjectPokemon comes in. This is just a project for fun, and absolutely NO money will be generated from it's existence.

ProjectPokemon exists as an Android app. The user pulls open the app and see's what looks like the Gameboy SP style Pokedex. On the top half, the user sees a map. This is where the user is currently standing in the world. On the bottom half, the user sees a "hub". In this hub, the user can navigate through multiple spaces like: My Pokemon, My Team, My Items, etc... None of this means much without battling, though. Battling occurs in two ways: encountering a wild Pokemon, or challenging a user (whether in Person or at a gym). This battling will look a lot like Gen IV battling, just with worse animations. The gym is still an idea in progress and will come later. Besides battling, there is trading. You can trade Pokemon with anyone *in person*. There are two important reasons for this: account safety and making the game hard. The game wouldn't be fun if you could just get any Pokemon from whoever. With trading required to be in person, there's little incentive to hack someones account. It also makes "exotic" Pokemon a thrill to get.

# The Plan
## Step 1 - The JSON files.
#### Part A - Create a JSON file of the entire list of Pokemon (up to 151).
This JSON file will reflect the database. This JSON file will remain stagnant. The reasoning for this is to have an easily readable and modifiable data file. See pokemon_base.json for more details on the design.
#### Part B - Create a JSON file for the entire list of Moves.
See Part A. See moves.json for more details on the design.
#### Part C - Create a JSON file for the entire list of Items.
See Part A. See items.json for more details on the design.

## Step 2 - The Web Server.
#### Part A - Create a running web server on local host.
This web server will be implemented with nodejs/express. The goal is to learn about web servers. While there are easier ways to do this, the main goal is to learn how to implement these things yourself, so using a 99% work-done-for-you API isn't the right choice.
#### Part B - Create the database in MongoDB.
This creation process will mainly involve converting the JSON files from Step 1 to data stored in MongoDB. After adding one Pokemon, the database should be visually seen to verify that the table is storing data as expected.
#### Part C - Design the schema for holding User information.
For users to trade and battle one another, there needs to be a system for storing log-in information. The schema should involve parameters like id, email, password, username, pokemon_in_cpu, pokemon_in_team, items.
#### Part D - Verify that MongoDB is holding all the necessary tables.
The tables MongoDB should be holding are:
 - PokemonBase: id, name, pokedex_entry, percent_male, primary_type, secondary_type, learn_set, tm_set, ability_set, lvls_up_at, lvls_up_to, locations, sprites
 - Moves: id, name, pp, power, accuracy, type, contact_type, tm_id, recharge, delayed, lingering, trapping, causes_effects, targets_self, animation
 - Items: id, name, image
 - Users: id, email, username, password, pokemon_in_cpu, pokemon_in_team, items_owned

## Step 3 - The Android Application.
#### Part A - Create a basic android application.
This is the main application. The goal of this step is to just get it created. It will have a minimum Android version of 6.0.
#### Part B - Implement the ability to get the user's latitude and longitude every ~20 seconds.
This is the bread and butter of the app. Verify that you can ping lat/long every so often.
#### Part C - Verify that data can be pulled from / sent to the Web Server.
Connect to the web server and request data based off the lat/long.
