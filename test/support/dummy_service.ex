defmodule DummyService do
  @moduledoc false
  alias Counter.Counter

  def run do
    count = Counter.value()
    10 |> :timer.seconds() |> :rand.uniform() |> Process.sleep()
    count
  end
end
