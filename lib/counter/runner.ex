defmodule Counter.Runner do
  @moduledoc false
  alias Counter.Total

  def run(fun) do
    1..100
    |> Enum.map(fn _ -> Task.async(fn -> run_batch(fun) end) end)
    |> Task.await_many(:timer.minutes(1))
  end

  defp run_batch(fun) do
    Enum.each(1..10, fn _ -> Total.add(fun.()) end)
  end
end
