
# ProjectPokemon
Welcome to ProjectPokemon! This README is primarily for this project's plan. Note that this plan is not complete, and probably won't be complete for awhile.

# The Idea

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

## Step 3 - The Android Application.
#### Part A - Create a basic android application.
This is the main application. The goal of this step is to just get it created. It will have a minimum Android version of 6.0.
#### Part B - Implement the ability to get the user's latitude and longitude every ~20 seconds.
This is the bread and butter of the app. Verify that you can ping lat/long every so often.
#### Part C - Verify that data can be pulled from / sent to the Web Server.
Connect to the web server and request data based off the lat/long.
