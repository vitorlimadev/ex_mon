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
    Agent.update(__MODULE__, fn _ -> update_game_lifecycle(state) end)

    info()
  end

  def update_game_lifecycle(state) do
    state
    |> check_game_over()
    |> change_turn()
  end

  defp check_game_over(
         %{
           player: %Player{life: player_life},
           computer: %Player{life: computer_life}
         } = state
       )
       when player_life == 0 or computer_life == 0,
       do: handle_game_over(state, player_life, computer_life)

  defp check_game_over(state), do: state

  defp handle_game_over(state, 0, _) do
    {Map.put(state, :status, :game_over), :computer}
  end

  defp handle_game_over(state, _, 0) do
    {Map.put(state, :status, :game_over), :player}
  end

  defp change_turn({%{status: :game_over}, winner}),
    do: Status.print_game_over_message(winner)

  defp change_turn(%{turn: :player} = state), do: Map.put(state, :turn, :computer)
  defp change_turn(%{turn: :computer} = state), do: Map.put(state, :turn, :player)

  def fetch_player(who), do: Map.get(info(), who)
  def turn, do: Map.get(info(), :turn)
end
