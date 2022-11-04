defmodule TodoWeb.ItemComponentTest do
  use ExUnit.Case, async: true

  setup_all do
    timezone = "America/Phoenix"
    today = Timex.today(timezone)

    [today: today, timezone: timezone]
  end

  describe "compare_date" do
    test "should return no styles with a nil timezone", context do
      assert ItemComponent.compare_date(context[:today], nil) == ""
    end

    test "should return a bold red style for an item past its due date", context do
      yesterday = context[:today] |> Timex.shift(days: -1)

      assert ItemComponent.compare_date(yesterday, context[:timezone]) == "font-bold text-red-500"
    end

    test "should return a bold orange style for an item due today", context do
      assert ItemComponent.compare_date(context[:today], context[:timezone]) ==
               "font-bold text-orange-500"
    end

    test "should return no style for an item due in the future", context do
      tomorrow = context[:today] |> Timex.shift(days: 1)

      assert ItemComponent.compare_date(tomorrow, context[:timezone]) == ""
    end
  end
end
