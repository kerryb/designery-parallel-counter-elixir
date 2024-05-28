defmodule Counter.RunnerTest do
  use ExUnit.Case, async: false

  alias Counter.Runner
  alias Counter.Total

  describe "Counter.Runner.run/0" do
    setup do
      {:ok, _} = Application.ensure_all_started(:counter)
      :ok
    end

    test "Ends up with the correct total in a reasonable time" do
      {seconds, _} = :timer.tc(Runner, :run, [&DummyService.run/0], :second)
      assert Total.value() == 500_500
      assert seconds < 20
    end
  end
end
