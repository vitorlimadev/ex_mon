# ExMon

A Pokemon clone for teh Erlang VM!

## How to run

Download the repository and run in terminal:

```shell
iex -S mix
```

To start the game inside iex, run the start_game function that takes a player as a parameter. You can create a player with the create_player function. The create_player function takes 4 parameters, is your Pokemon's name first, then his normal attack's name, then his strong attack's name, and his healing ability's name. You can also call this function without arguments to create a default Charizard for you.

```elixir
ExMon.start_game(ExMon.create_player("Charizard", "Heat Wave", "Flame Burst", "Dragon snack")
```

To play, use the make_action function with the name of the action you inserted, like:

```elixir
ExMon.make_action("Heat Wave")
```

Have fun!

This project was build during the [Elixir and Phoenix Udemy course](https://www.udemy.com/course/elixir-e-phoenix-do-zero/).
