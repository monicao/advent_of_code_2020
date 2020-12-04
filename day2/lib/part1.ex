defmodule Part1 do
  @moduledoc """
  Solutions for Advent of Code 2020's Day 2 Part 1.
  """

  @spec valid_password_count(String.t()) :: pos_integer()
  def valid_password_count(lines) do
    Enum.count(lines, fn(line) ->
      [[_, min, max, char, password]] = Regex.scan(~r/(\d+)-(\d+) ([a-z]): ([a-z]+)/, line)
      min = String.to_integer(min)
      max = String.to_integer(max)
      valid_password?(password, min: min, max: max, char: char)
    end)
  end

  defp valid_password?(password, min: min, max: max, char: c) do
    without_char = String.replace(password, c, "")
    num_occurences = String.length(password) - String.length(without_char)
    num_occurences >= min && num_occurences <= max
  end

  def valid_password_count_stream(path) do
    File.stream!(path)
      |> Stream.reject(fn(line) ->
        [[_, min, max, char, password]] = Regex.scan(~r/(\d+)-(\d+) ([a-z]): ([a-z]+)/, line)
        without_char = String.replace(password, char, "")
        num_occurences = String.length(password) - String.length(without_char)

        num_occurences < String.to_integer(min) || num_occurences > String.to_integer(max)
      end)
      |> Enum.count
  end


  #
  # Other people's solutions I learned from
  #

  # https://elixirforum.com/t/advent-of-code-2020-day-2/35931/2

  def other_solution1(path) do
    ok_for_part1? = fn{lo, hi, char, password}->
      password
      |> String.graphemes()  # <----
      |> Enum.count(& &1 == char)
      |> Kernel.in(lo..hi) # <----
    end

    path
    |> File.stream!([], :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, ~r/[-: ]/, trim: true)) # <--- elegant way to split
    |> Stream.map(fn[lo, hi, char, password]-> {String.to_integer(lo), String.to_integer(hi), char, password} end)
    |> Enum.count(ok_for_part1?)
  end
end
