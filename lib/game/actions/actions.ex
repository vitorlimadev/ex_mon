defmodule ExMon.Game.Actions do
  alias ExMon.Game
  alias ExMon.Game.Actions.{Attack}

  def fetch_action(action) do
    Game.fetch_player(:player)
    |> Map.get(:actions)
    |> find_action(action)
  end

  defp find_action(actions, action) do
    Enum.find_value(actions, {:error, action}, fn {k, v} ->
      if v == action, do: {:ok, k}
    end)
  end

  def attack(action) do
    case Game.turn() do
      :player -> Attack.attack_opponent(:computer, action)
      :computer -> Attack.attack_opponent(:player, action)
    end
  end
end
