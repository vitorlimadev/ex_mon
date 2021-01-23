defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game

  @normal_attack_power 18..25
  @strong_attack_power 10..35

  def attack_opponent(opponent, action) do
    damage = calculate_damage(action)

    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_opponent_life(opponent)
  end

  defp calculate_damage(:normal_attack), do: Enum.random(@normal_attack_power)
  defp calculate_damage(:strong_attack), do: Enum.random(@strong_attack_power)

  defp calculate_total_life(life, damage) when life - damage <= 0, do: 0
  defp calculate_total_life(life, damage), do: life - damage

  defp update_opponent_life(life, opponent) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
  end
end
