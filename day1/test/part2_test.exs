defmodule Part2Test do
  use ExUnit.Case
  doctest Part2

  test "works with three inputs" do
    input = [2000, 19, 1]
    assert Part2.find_product(input) == {:ok, 38000}
    assert Part2.find_product_comprehensions(input) == {:ok, 38000}
  end

  test "works when no numbers are found" do
    input = [2000, 19, 2]
    assert Part2.find_product(input) == {:error, "No three numbers were found that add up to 2020"}
    assert Part2.find_product_comprehensions(input) == {:error, "No three numbers were found that add up to 2020"}
  end

  test "finds correct product" do
    input = [
      1721,
      979,
      366,
      299,
      675,
      1456,
    ]
    assert Part2.find_product(input) == {:ok, 241861950}
    assert Part2.find_product_comprehensions(input) == {:ok, 241861950}
  end

  test "find correct product for long list" do
    input = File.read!("#{File.cwd!}/test/input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
    assert Part2.find_product(input) == {:ok, 278783190}
    assert Part2.find_product_comprehensions(input) == {:ok, 278783190}
  end
end
