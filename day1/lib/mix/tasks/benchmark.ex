defmodule Mix.Tasks.Benchmark do
  use Mix.Task

  @shortdoc "Benchmark the solutions"
  def run(_) do
    large_input = File.read!("#{File.cwd!}/test/input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)

    Benchee.run(
      %{
        "reduce_while" => fn input -> Day1.find_product(input) end,
        "find_find" => fn input -> Day1.find_product_naive(input) end,
      },
      inputs: %{
        "Small" => [1721, 979, 366, 299, 675, 1456],
        "Large" => large_input,
      },
      memory_time: 2
    )
  end
end
