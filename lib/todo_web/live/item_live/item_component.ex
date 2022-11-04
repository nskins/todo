defmodule ItemComponent do
  use TodoWeb, :live_component
  alias Todo.Notebook.Item

  def compare_date(due_date, timezone) do
    local_date = Timex.now(timezone)

    case local_date do
      {:error, _} ->
        ""

      _ ->
        val = Date.compare(due_date, local_date)

        case val do
          :lt -> "font-bold text-red-500"
          :eq -> "font-bold text-orange-500"
          :gt -> ""
        end
    end
  end
end
