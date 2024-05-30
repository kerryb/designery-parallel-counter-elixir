defmodule ParallelSum.DummyService do
  @moduledoc """
  A simulation of some kind of external service that retreives the next counter
  value, then pauses for a random time up to one second before returning it.
  """

  alias ParallelSum.Counter

  def run do
    count = Counter.next_value()
    1 |> :timer.seconds() |> :rand.uniform() |> Process.sleep()
    count
  end
end
