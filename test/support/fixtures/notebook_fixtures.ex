defmodule Todo.NotebookFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Notebook` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        description: "some description"
      })
      |> Todo.Notebook.create_item()

    item
  end
end
