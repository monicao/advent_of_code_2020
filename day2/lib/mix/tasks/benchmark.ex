defmodule Mix.Tasks.Benchmark do
  use Mix.Task

  @formatters [
    Benchee.Formatters.HTML,
    Benchee.Formatters.Console
  ]

  @shortdoc "Benchmark the solutions"
  def run(_) do
    large_input = File.read!("#{File.cwd!}/test/input.txt")
      |> String.split("\n", trim: true)

    Benchee.run(
      %{
        "enum" => fn input -> Part1.valid_password_count(input) end,
        "streams" => fn _input -> Part1.valid_password_count_stream("./test/input.txt") end,
        "streams_count_over_string" => fn _input -> Part1.other_solution1("./test/input.txt") end,
      },
      inputs: %{
        "Large" => large_input,
      },
      memory_time: 2,
      formatters: @formatters
    )

    IO.puts "----------"
    IO.puts "Part 2"
    IO.puts "----------"
  end
end
