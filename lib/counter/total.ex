defmodule Counter.Total do
  @moduledoc false
  use Agent

  def start_link(opts \\ []), do: Agent.start_link(fn -> 0 end, opts)

  def add(total \\ __MODULE__, addend), do: Agent.update(total, fn count -> count + addend end)
  def value(total \\ __MODULE__), do: Agent.get(total, & &1)
end
