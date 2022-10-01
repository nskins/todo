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
            where: i.user_id == ^user_id,
            order_by: [desc: i.id]

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

  Raises `MatchError` if the User is not authorized to create the Item.

  ## Examples

      iex> create_item(5, %{field: value})
      {:ok, %Item{}}

      iex> create_item(5, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

      iex> create_item(6, %{user_id: 5})
      ** (MatchError)

  """
  def create_item(user_id, attrs \\ %{}) do
    %{ "user_id" => ^user_id } = attrs

    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
    |> broadcast(:item_created)
  end

  @doc """
  Updates a item.

  Raises `MatchError` if the User is not authorized to update the Item.

  ## Examples

      iex> update_item(5, item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(5, item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

      iex> update_item(5, item, %{user_id: 6})
      ** (MatchError)

  """
  def update_item(user_id, %Item{} = item, attrs) do
    # This ensures the original item belongs to the user.
    %Item{ user_id: ^user_id } = item

    # This ensures the user is not trying to
    # update the item to belong to another user.
    %{ "user_id" => ^user_id } = attrs

    item
    |> Item.changeset(attrs)
    |> Repo.update()
    |> broadcast(:item_updated)
  end

  @doc """
  Deletes a item.

  Raises `MatchError` if the User is not authorized to delete the Item.

  ## Examples

      iex> delete_item(5, item)
      {:ok, %Item{}}

      iex> delete_item(5, item)
      {:error, %Ecto.Changeset{}}

      iex> delete_item(6, item)
      ** (MatchError)

  """
  def delete_item(user_id, %Item{} = item) do
    # This ensures the item belongs to the user.
    %Item{ user_id: ^user_id } = item

    item
    |> Repo.delete()
    |> broadcast(:item_deleted)
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

  def subscribe do
    Phoenix.PubSub.subscribe(Todo.PubSub, "items")
  end

  defp broadcast({:error, _reason} = error, _event), do: error
  defp broadcast({:ok, item}, event) do
    Phoenix.PubSub.broadcast(Todo.PubSub, "items", {event, item})
    {:ok, item}
  end

end
