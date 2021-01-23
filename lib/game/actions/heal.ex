defmodule ExMon.Game.Actions.Heal do
  alias ExMon.Game
  alias ExMon.Game.Status

  @max_life 100
  @heal_power 18..25

  def heal_self(player) do
    heal = Enum.random(@heal_power)

    show_healing_status(heal, player)

    player
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(heal)
    |> update_life(player)
  end

  defp calculate_total_life(life, heal) when life + heal >= 100, do: @max_life
  defp calculate_total_life(life, heal), do: life + heal

  defp update_life(life, player) do
    new_player =
      player
      |> Game.fetch_player()
      |> Map.put(:life, life)

    Game.info()
    |> Map.put(player, new_player)
    |> Game.update()
  end

  defp show_healing_status(heal, player) do
    player
    |> Game.fetch_player()
    |> Map.get(:name)
    |> Status.print_heal_message(heal)
  end
end
