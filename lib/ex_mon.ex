defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Status, Actions}

  @computer_name "Blastoise"

  def create_player(name, normal_attack, strong_attack, heal) do
    Player.build(name, normal_attack, strong_attack, heal)
  end

  def create_player() do
    Player.build("Charizard", "Fire ball", "Inferno", "Coal")
  end

  def start_game(player) do
    @computer_name
    |> create_player("Torrent", "Rain Dish", "Fish")
    |> Game.start(player)

    Status.print_round_message()
  end

  def make_action(action) do
    action
    |> Actions.fetch_action()
    |> do_action()
  end

  defp do_action({:ok, action}) do
    case action do
      :heal -> "Healed!"
      _ -> Actions.attack(action)
    end
  end

  defp do_action({:error, invalid_action}) do
    Status.print_invalid_action_message(invalid_action)
  end
end
