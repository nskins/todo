defmodule Todo.NotebookFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Notebook` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    %{ "user_id" => user_id } = attrs

    combined_attrs =
      attrs
      |> Enum.into(%{
        "description" => "some description",
        "status" => :done,
        "due_date" => ~D[2022-10-17]
      })

    {:ok, item} = Todo.Notebook.create_item(user_id, combined_attrs)

    item
  end
end
