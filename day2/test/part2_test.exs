defmodule Part2Test do
  use ExUnit.Case
  doctest Part2

  test "zero when no passwords are given " do
    assert Part1.valid_password_count([]) == 0
  end

  test "counts the number of valid passwords" do
    input = [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc",
    ]
    assert Part2.valid_password_count(input) == 1
  end

  test "counts the number of valid passwords in list" do
    input = File.read!("#{File.cwd!}/test/input.txt")
      |> String.split("\n", trim: true)
    assert Part2.valid_password_count(input) == 354
  end
end
