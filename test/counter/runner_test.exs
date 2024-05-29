defmodule Counter.RunnerTest do
  use ExUnit.Case, async: false

  alias Counter.Runner
  alias Counter.Total

  describe "Counter.Runner.run/0" do
    setup do
      Counter.Counter.reset()
      Total.reset()
      :ok
    end

    test "Ends up with the correct total in a reasonable time with 1,000 processes" do
      {seconds, _} = :timer.tc(Runner, :run, [&DummyService.run/0, 100], :second)
      assert Total.value() == 500_500
      assert seconds < 20
    end

    test "Ends up with the correct total in a reasonable time with 100,000 processes" do
      {seconds, _} = :timer.tc(Runner, :run, [&DummyService.run/0, 100_000], :second)
      assert Total.value() == 500_000_500_000
      assert seconds < 20
    end
  end
end
