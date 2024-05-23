defmodule Counter.Counter do
  use Agent

  def start_link(opts \\ []), do: Agent.start_link(fn -> 0 end, opts)

  def value(counter), do: Agent.get_and_update(counter, fn count -> {count + 1, count + 1} end)
end
