defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "finds correct product" do
    input = [
      1721,
      979,
      366,
      299,
      675,
      1456,
    ]
    assert Day1.find_product(input) == {:ok, 514579}
    assert Day1.find_product_naive(input) == {:ok, 514579}
    assert Day1.find_product_comprehensions(input) == {:ok, 514579}
  end

  test "find correct product for long list" do
    input = File.read!("#{File.cwd!}/test/input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
    assert Day1.find_product(input) == {:ok, 538464}
  end
end
