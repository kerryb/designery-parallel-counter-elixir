defmodule ParallelSum.Total do
  @moduledoc false
  use Agent

  def start_link(opts \\ []), do: Agent.start_link(fn -> 0 end, opts)

  def add(total \\ __MODULE__, addend), do: Agent.update(total, fn count -> count + addend end)
  def reset(total \\ __MODULE__), do: Agent.update(total, fn _count -> 0 end)
  def value(total \\ __MODULE__), do: Agent.get(total, & &1)
end
