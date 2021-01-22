defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message() do
    IO.puts("\n===== Game started! =====\n")
    Game.info()
  end
end
