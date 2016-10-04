
# ProjectPokemon
Welcome to ProjectPokemon! This README is primarily for this project's plan. Note that this plan is not complete, and probably won't be complete for awhile.

# The Idea
The goal of this project is to bring old-school Pokemon to the modern world. Pokemon Go has done just that, but it is *very* simple. That is, there's no trading, battling is garbage, and there's little rhyme or reason as to why certain Pokemon appear where they do. That is where ProjectPokemon comes in. This is just a project for fun, and absolutely NO money will be generated from it's existence.

ProjectPokemon exists as an Android app. The user pulls open the app and see's what looks like the Gameboy SP style Pokedex. On the top half, the user sees a map. This is where the user is currently standing in the world. On the bottom half, the user sees a "hub". In this hub, the user can navigate through multiple spaces like: My Pokemon, My Team, My Items, etc... None of this means much without battling, though. Battling occurs in two ways: encountering a wild Pokemon, or challenging a user (whether in Person or at a gym). This battling will look a lot like Gen IV battling, just with worse animations. The gym is still an idea in progress and will come later. Besides battling, there is trading. You can trade Pokemon with anyone *in person*. There are two important reasons for this: account safety and making the game hard. The game wouldn't be fun if you could just get any Pokemon from whoever. With trading required to be in person, there's little incentive to hack someones account. It also makes "exotic" Pokemon a thrill to get.


# The Components

## The Database
### Pokemon
##### PokemonBase
Generic Pokemon information. This table includes basic things like name, id, type, etc.
##### Locations
Pokemon locations. This table includes lat/long coordinates for Pokemon, as well as the frequency in which a Pokemon will appear at the coordinate.
### Moves
##### MoveBase
Move information. This table includes basic information about moves like name, power, pp, etc.
### Items
##### ItemBase
Item information. This is table may not be implemented as items may not exist in the game. More information on that will come.
### Users
##### Users
User information. This table will hold all the information about a user, like emails, encrypted passwords, Pokemon, etc.

## The Web Server
The web server uses the Sinatra Ruby gem. It's a very simple RESTful-friendly backend. The basic idea is to be able to send / get data to / from the server.

## The Android App
The Android App is going to be the bread and butter of the project.
The app caches the data from the database in an effort to minimize data usage / decrease loading times. It also sends GPS coordinates periodically to the web server to see if a Pokemon wants to battle. More information will come on this later.
