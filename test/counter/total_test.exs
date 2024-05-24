defmodule Counter.TotalTest do
  use ExUnit.Case, async: true

  alias Counter.Total

  describe "Counter.Total" do
    setup do
      {:ok, total} = Total.start_link([])
      %{total: total}
    end

    test "maintains a persistent total", %{total: total} do
      assert Total.value(total) == 0
      :ok = Total.add(total, 2)
      assert Total.value(total) == 2
      :ok = Total.add(total, 1)
      assert Total.value(total) == 3
    end
  end
end