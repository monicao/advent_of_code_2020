defmodule Day1 do
  @moduledoc """
  Solutions for Advent of Code 2020's Day 1 Part 1.
  """

  @doc """
  Find the product of the two numbers in the input that add up to 2020
  """
  def find_product(numbers) do
    numbers
      |> Enum.reduce_while(MapSet.new, fn(num, previous_numbers) ->
        if MapSet.member?(previous_numbers, 2020 - num) do
          {:halt, {num, (2020 - num)}}
        else
          {:cont, MapSet.put(previous_numbers, num)}
        end
      end)
      |> compute_product
  end

  defp compute_product({num1, num2}), do: {:ok, num1 * num2}
  defp compute_product(_), do: {:error, "Could not find two numbers that add up to 2020"}

  @doc """
  Find the product of the two numbers in the input that add up to 2020
  This is the naive implementation that uses nested Enum.find
  """
  def find_product_naive(numbers) do
    numbers
      |> Enum.find(fn(num) ->
        Enum.find(numbers, fn(complement) -> complement == (2020 - num) end)
      end)
      |> (fn(num) ->
        case num do
          nil -> {:error, "Could not find two numbers that add up to 2020"}
          _ -> {:ok, num * (2020 - num)}
        end
      end).()
  end

  @doc """
  Find the product of the two numbers in the input that add up to 2020.
  This uses the elegant list comprehensions solution written by adamu.
  https://elixirforum.com/t/advent-of-code-2020-day-1/35917/3
  Added it here to see the benchmark results.
  """
  def find_product_comprehensions(numbers) do
    [{a, b} | _] = for i <- numbers, j <- numbers, i + j == 2020, do: {i, j}
    {:ok, a * b}
  end

end
