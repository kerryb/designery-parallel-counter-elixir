defmodule ParallelSum.TotalTest do
  use ExUnit.Case, async: true

  alias ParallelSum.Total

  describe "ParallelSum.Total" do
    setup do
      {:ok, total} = start_supervised(Total)
      %{total: total}
    end

    test "maintains a persistent total", %{total: total} do
      assert Total.value(total) == 0
      :ok = Total.add(total, 2)
      assert Total.value(total) == 2
      :ok = Total.add(total, 1)
      assert Total.value(total) == 3
    end

    test "can be reset to zero", %{total: total} do
      :ok = Total.add(total, 2)
      assert Total.value(total) == 2
      :ok = Total.reset(total)
      assert Total.value(total) == 0
    end
  end
end
