defmodule ParallelSum.CounterTest do
  use ExUnit.Case, async: true

  alias ParallelSum.Counter

  describe "ParallelSum.Counter" do
    setup do
      {:ok, counter} = Counter.start_link([])
      %{counter: counter}
    end

    test "maintains a persistent counter, starting from 1", %{counter: counter} do
      assert Counter.value(counter) == 1
      assert Counter.value(counter) == 2
      assert Counter.value(counter) == 3
    end

    test "can be reset to zero", %{counter: counter} do
      assert Counter.value(counter) == 1
      assert Counter.value(counter) == 2
      :ok = Counter.reset(counter)
      assert Counter.value(counter) == 1
    end
  end
end
