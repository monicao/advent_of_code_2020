defmodule Part2 do
  @moduledoc """
  Solutions for Advent of Code 2020's Day 2 Part 2
  """

  @spec valid_password_count(String.t()) :: pos_integer()
  def valid_password_count(lines) do
    Enum.count(lines, fn(line) ->
      [[_, pos1, pos2, char, password]] = Regex.scan(~r/(\d+)-(\d+) ([a-z]): ([a-z]+)/, line)
      pos1 = String.to_integer(pos1)
      pos2 = String.to_integer(pos2)

      case {String.at(password, pos1 - 1) == char, String.at(password, pos2 - 1) == char} do
        {true, true} -> false
        {true, false} -> true
        {false, true} -> true
        {false, false} -> false
      end
    end)
  end
end
