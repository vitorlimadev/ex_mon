defmodule ExMon.Game do
  use Agent

  def start(computer, player) do
    initial_values = %{
      computer: computer,
      player: player,
      turn: :player,
      status: :started
    }

    Agent.start_link(fn -> initial_values end, name: __MODULE__)
  end

  def info() do
    Agent.get(__MODULE__, & &1)
  end

  def update(state) do
    Agent.update(__MODULE__, fn _ -> state end)
  end

  def fetch_player(who), do: Map.get(info(), who)
  def turn, do: Map.get(info(), :turn)
end
