defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message() do
    IO.puts("\n===== Game started! =====\n")
    Game.info()
  end

  def print_invalid_action_message(invalid_action) do
    IO.puts("\n===== Error: #{invalid_action} is not a valid action.  =====\n")
  end

  def print_attack_message(attacker, action, damage) do
    IO.puts("\n===== #{attacker} used #{action}! Damage: #{damage}  =====\n")
  end

  def print_heal_message(player, amount) do
    IO.puts("\n===== #{player} healed #{amount}!  =====\n")
  end

  def print_game_over_message(winner) do
    IO.puts("\n===== Game over: #{winner} wins!  =====\n")
  end
end
