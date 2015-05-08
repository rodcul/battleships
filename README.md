Battleships
============

Create a battleships game in Ruby!

https://github.com/makersacademy/course/blob/master/battle_ships/battle_ships.md

Run a test game in your terminal:

```
ruby demo_game.rb
```

Sample output:

```
board = Board.new 5
cruiser = Ship.new :cruiser
board.place_ship(:a1,cruiser,:horizontal)
battleship = Ship.new :battleship
board.place_ship(:b5,battleship,:vertical)
board.fire :a1
board.fire :a2
board.fire :a3
board.fire :b1
board.fire :a4

board.print
puts cruiser.inspect
puts battleship.inspect


* * * M ·
M · · · S
· · · · S
· · · · S
· · · · S

#<Ship:0x007feb73887050 @type=:cruiser, @size=3, @hits=3, @sunk=true>
#<Ship:0x007feb738869c0 @type=:battleship, @size=4, @hits=0, @sunk=false>
```


# Class Responsibility Collaborator

### BOARD
* Knows its size
* Knows location of ships
* Can receive fire (saves hits/misses)

### SHIP
* Knows its size
* Can be hit
* Can be sunk



# User stories

```
As a player
So that I can prepare for the game
I would like to place a ship in a board coordinates

As a player
So that I can play a more interesting game
I would like to have a range of ship sizes to choose from

As a player
So that I can create a layout of ships to fox my opponent
I would like to be able to choose the directions my ships face in

As a player
So that I can have a coherent game
I would like ships to be constrained to be on the board

As a player
So that I can have a coherent game
I would like ships to be constrained not to overlap

As a player
So that I can win the game
I would like to be able to fire at my opponents board

As a player
So that I know when to finish playing
I would like to know when I have won or lost

As a player
So that I can consider my next shot
I would like an overview of my hits and misses so far

As a player
So that I can play against a human opponent
I would like to play a two-player game
```

![Battleships](http://upload.wikimedia.org/wikipedia/commons/e/e4/Battleships_Paper_Game.svg "Battleships")
