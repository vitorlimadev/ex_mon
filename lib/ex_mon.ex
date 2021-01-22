defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Status, Actions}

  @computer_name "Blastoise"

  def create_player(name, normal_attack, strong_attack, heal) do
    Player.build(name, normal_attack, strong_attack, heal)
  end

  def create_stub() do
    Player.build("Charizard", "Fire ball", "Inferno", "Coal")
  end

  def start_game(player) do
    @computer_name
    |> create_player("Torrent", "Rain Dish", "Fish")
    |> Game.start(player)

    Status.print_round_message()
  end

  def make_action(action) do
    Actions.fecth_action(action)
  end
end
