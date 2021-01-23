defmodule ExMon.Player do
  alias ExMon.Game

  @keys [:life, :name, :actions]
  @max_life 100

  @enforce_keys @keys
  defstruct @keys

  def build(name, normal_attack, strong_attack, heal) do
    %ExMon.Player{
      life: @max_life,
      name: name,
      actions: %{
        normal_attack: normal_attack,
        strong_attack: strong_attack,
        heal: heal
      }
    }
  end
end
