defmodule Todo.Notebook do
  @moduledoc """
  The Notebook context.
  """

  import Ecto.Query, warn: false
  alias Todo.Repo

  alias Todo.Notebook.Item

  @doc """
  Returns the list of items by user.

  ## Examples

      iex> list_items_by_user(2)
      [%Item{}, ...]

  """
  def list_items_by_user(user_id) do
    query = from i in Item,
            where: i.user_id == ^user_id

    Repo.all(query)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  Raises `MatchError` if the User is not authorized to access the Item.

  ## Examples

      iex> get_item!(123, 5)
      %Item{}

      iex> get_item!(456, 5)
      ** (Ecto.NoResultsError)

      iex> get_item!(312, 6)
      ** (MatchError)

  """
  def get_item!(id, user_id) do
    item = Repo.get!(Item, id)

    %Item{ user_id: ^user_id } = item

    item
  end

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end
end
