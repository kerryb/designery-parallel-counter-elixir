defmodule ParallelSum.Total do
  @moduledoc """
  A server that maintains a total, which have a number added to it.

  This could obviously just be an Agent (and was in earlier commits), but is
  here as an example of a simple GenServer.
  """

  use GenServer

  def start_link(opts \\ []), do: GenServer.start_link(__MODULE__, [], opts)

  def add(total \\ __MODULE__, addend), do: GenServer.cast(total, {:add, addend})

  def reset(total \\ __MODULE__), do: GenServer.cast(total, :reset)

  def value(total \\ __MODULE__), do: GenServer.call(total, :value)

  @impl GenServer
  def init(_init_arg), do: {:ok, 0}

  @impl GenServer
  def handle_cast({:add, addend}, state), do: {:noreply, state + addend}
  def handle_cast(:reset, _state), do: {:noreply, 0}

  @impl GenServer
  def handle_call(:value, _from, state), do: {:reply, state, state}
end
