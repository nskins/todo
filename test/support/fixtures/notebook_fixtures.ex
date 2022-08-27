defmodule Todo.NotebookFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Notebook` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    user = Todo.AccountsFixtures.user_fixture()

    {:ok, item} =
      attrs
      |> Enum.into(%{
        description: "some description",
        user_id: user.id
      })
      |> Todo.Notebook.create_item()

    item
  end
end
