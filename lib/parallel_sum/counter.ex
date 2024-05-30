defmodule ParallelSum.Counter do
  @moduledoc """
  A simple Agent that returns successive numbers.
  """

  use Agent

  def start_link(opts \\ []), do: Agent.start_link(fn -> 0 end, opts)

  def reset(counter \\ __MODULE__), do: Agent.update(counter, fn _count -> 0 end)

  def next_value(counter \\ __MODULE__),
    do: Agent.get_and_update(counter, fn count -> {count + 1, count + 1} end)
end
