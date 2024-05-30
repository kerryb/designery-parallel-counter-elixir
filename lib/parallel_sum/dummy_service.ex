defmodule ParallelSum.DummyService do
  @moduledoc false
  alias ParallelSum.Counter

  def run do
    count = Counter.next_value()
    1 |> :timer.seconds() |> :rand.uniform() |> Process.sleep()
    count
  end
end
