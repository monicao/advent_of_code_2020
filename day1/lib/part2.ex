defmodule Part2 do
  @moduledoc """
  Solutions for Advent of Code 2020's Day 1 Part 1.
  """

  @doc """
  Return the product of the first 3 combinations of numbers that add up to 2020.
  Note: This makes use of the fact that it is OK to pull combinations of the same number
  because 2020 / 3 has a remainder.
  """
  @spec find_product([pos_integer()]) :: {:ok, pos_integer()} | {:error, String.t()}
  def find_product(numbers) do
    {_, number_map} = numbers
      |> Enum.reduce({0, %{}}, fn(num, {index, acc}) ->
        {index + 1, Map.put(acc, index, num)}
      end) # %{ 0 => num0, 1 => num1 }

    products = for index <- (0..length(numbers) - 3),
      index2 <- (index + 1..length(numbers) - 2),
      index3 <- (index2 + 1..length(numbers) - 1),
      sum_is_2020?(number_map, {index, index2, index3}) do
        %{^index => num1, ^index2 => num2, ^index3 => num3} = number_map
        num1 * num2 * num3
    end

    case products do
      [product | _tail] -> {:ok, product}
      [] -> {:error, "No three numbers were found that add up to 2020"}
    end
  end

  @spec sum_is_2020?(%{pos_integer() => pos_integer()}, {pos_integer(), pos_integer(), pos_integer()}) :: boolean()
  defp sum_is_2020?(number_map, {a, b, c}) do
    %{^a => num1, ^b => num2, ^c => num3} = number_map
    num1 + num2 + num3 == 2020
  end

  # adamu's solution from:
  # https://elixirforum.com/t/advent-of-code-2020-day-1/35917/19
  # Added for benchmarking
  def find_product_comprehensions(numbers) do
    products = for a <- numbers, b <- numbers, c <- numbers, a + b + c == 2020 do
      a * b * c
    end

    case products do
      [product | _tail] -> {:ok, product}
      [] -> {:error, "No three numbers were found that add up to 2020"}
    end
  end

end
