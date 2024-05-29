defmodule ParallelSum.Runner do
  @moduledoc false
  alias ParallelSum.Total

  def run(fun, number_of_processes) do
    1..number_of_processes
    |> Enum.map(fn _ -> Task.async(fn -> run_batch(fun) end) end)
    |> Task.await_many(:timer.minutes(1))
  end

  defp run_batch(fun) do
    Enum.each(1..10, fn _ -> Total.add(fun.()) end)
  end
end
