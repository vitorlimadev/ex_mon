defmodule ExMon.Game.Actions do
  alias ExMon.Game

  def fecth_action(action) do
    Game.player()
    |> Map.get(:actions)
    |> find_action(action)
  end

  defp find_action(actions, action) do
    Enum.find_value(actions, {:error, action}, fn {k, v} ->
      if v == action, do: {:ok, k}
    end)
  end
end
