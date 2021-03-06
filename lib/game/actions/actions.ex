defmodule ExMon.Game.Actions do
  alias ExMon.Game
  alias ExMon.Game.Actions.{Attack, Heal}

  def fetch_action(action) do
    Game.turn()
    |> Game.fetch_player()
    |> Map.get(:actions)
    |> find_action(action)
  end

  defp find_action(actions, action) do
    Enum.find_value(actions, {:error, action}, fn {k, v} ->
      if v == action, do: {:ok, k}
    end)
  end

  def fetch_action_name(player, action) do
    Game.fetch_player(player)
    |> Map.get(:actions)
    |> Map.get(action)
  end

  def attack(action, player) do
    case player do
      :player -> Attack.attack_opponent(:computer, action)
      :computer -> Attack.attack_opponent(:player, action)
    end
  end

  def heal(player) do
    Heal.heal_self(player)
  end
end
