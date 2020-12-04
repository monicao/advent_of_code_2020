defmodule Part1Test do
  use ExUnit.Case
  doctest Part1

  test "zero when no passwords are given " do
    assert Part1.valid_password_count([]) == 0
  end

  test "counts the number of valid passwords" do
    input = [
      "1-3 a: abcde",
      "1-3 b: cdefg",
      "2-9 c: ccccccccc",
    ]
    assert Part1.valid_password_count(input) == 2
  end

  test "counts the number of valid passwords in list" do
    input = File.read!("./test/input.txt")
      |> String.split("\n", trim: true)
    assert Part1.valid_password_count(input) == 614
    assert Part1.other_solution1("./test/input.txt") == 614
  end

  test "counts the number of valid passwords in list using a stream" do
    assert Part1.valid_password_count_stream("./test/input.txt") == 614
  end
end
