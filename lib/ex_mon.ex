defmodule ExMon do
  alias ExMon.Player

  def create_player(name, normal_attack, strong_attack, heal) do
    Player.build(name, normal_attack, strong_attack, heal)
  end
end
