defmodule ParallelSum.Runner do
  @moduledoc """
  Add successive values returned from `ParallelSum.DummyService` to `ParallelSum.Total`.

  It runs the specified number of tasks in parallel, and each task retreives
  and adds ten counter values (one after the other).
  """

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
