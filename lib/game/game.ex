defmodule ExMon.Game do
  alias ExMon.Player
  alias ExMon.Game.Status
  use Agent

  def start(computer, player) do
    initial_values = %{
      computer: computer,
      player: player,
      turn: :player,
      status: :battling
    }

    Agent.start_link(fn -> initial_values end, name: __MODULE__)
  end

  def info() do
    Agent.get(__MODULE__, & &1)
  end

  def update(state) do
    case check_game_over(state) do
      {:not_over, state} ->
        Agent.update(__MODULE__, fn _ -> change_turn(state) end)
        info()

      {:game_over, winner} ->
        Status.print_game_over_message(Map.get(fetch_player(winner), :name))
    end
  end

  defp check_game_over(%{
         player: %Player{life: 0}
       }),
       do: {:game_over, :computer}

  defp check_game_over(%{
         computer: %Player{life: 0}
       }),
       do: {:game_over, :player}

  defp check_game_over(state), do: {:not_over, state}

  defp change_turn(%{turn: :player} = state), do: Map.put(state, :turn, :computer)
  defp change_turn(%{turn: :computer} = state), do: Map.put(state, :turn, :player)

  def fetch_player(who), do: Map.get(info(), who)
  def turn, do: Map.get(info(), :turn)
end
