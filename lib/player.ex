defmodule ExMon.Player do
  @keys [:life, :name, :normal_attack, :strong_attack, :heal]
  @max_life 100

  @enforce_keys @keys
  defstruct @keys

  def build(name, normal_attack, strong_attack, heal) do
    %ExMon.Player{
      life: @max_life,
      name: name,
      normal_attack: normal_attack,
      strong_attack: strong_attack,
      heal: heal
    }
  end
end
