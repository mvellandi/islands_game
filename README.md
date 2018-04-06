# Islands Engine

This follows my progress through the book
[Functional Web Development with Elixir, OTP, and Phoenix](https://pragprog.com/book/lhelph/functional-web-development-with-elixir-otp-and-phoenix), by Lance Halvorson.

## Purpose

2-player "Battleship" style game with islands instead of navy ships. Players position 5 different island types with coordinates into their boards. Players take turns guessing opponent's island coordinates to "forest" them, and win the game.

## Structure

Game logic (from low-level to high) is defined in the following modules:
Coordinate, Board, Island, Guesses.

A Finite State Machine (FSM) is used to "define and enforce the order in which events can happen" (Halvorson, p.41). The Rules modules defines a manages a struct with 3 keys for game state, and statuses for player1 and player2. As the key game actions are succesfull, the game logic will update that struct. The Rules FSM is also called upon by the game logic to check state conditions, thereby allowing/disallowing behaviours. These include:

* If a 2nd player can be added
* If players can position and resposition their islands
* If players can guess coordinates, based on if it's their turn
* If the game has been won

A GenServer Game module is used to manage the actual game, logic, and state. It provides the API to the underlying actions, including:

* Adding a second player
* Positioning Islands
* Setting Islands
* Guessing Coordinates

To be continued...
