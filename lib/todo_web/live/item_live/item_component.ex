defmodule ItemComponent do
  use TodoWeb, :live_component
  require Date
  alias Todo.Notebook.Item  
  def compare_date(due_date) do 
    val = Date.compare(due_date, DateTime.utc_now())
    case val do
      :lt -> -1
      :gt -> 1
      :eq -> 0
    end
  end
end
