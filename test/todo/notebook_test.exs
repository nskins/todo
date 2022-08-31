defmodule Todo.NotebookTest do
  use TodoWeb.ConnCase

  alias Todo.Notebook

  describe "items" do
    alias Todo.Notebook.Item

    import Todo.NotebookFixtures

    setup [:register_and_log_in_user]

    test "list_items_by_user/1 returns all of the user's items", %{user: user} do
      item = item_fixture(%{"user_id" => user.id})
      assert Notebook.list_items_by_user(user.id) == [item]
    end

    test "get_item!/1 returns the item with given id", %{user: user} do
      item = item_fixture(%{"user_id" => user.id})
      assert Notebook.get_item!(item.id, user.id) == item
    end

    test "create_item/1 with valid data creates a item", %{user: user} do
      valid_attrs = %{ "description" => "some description", "user_id" => user.id}

      assert {:ok, %Item{} = item} = Notebook.create_item(user.id, valid_attrs)
      assert item.description == "some description"
    end

    test "create_item/1 with invalid data returns error changeset", %{user: user} do
      assert {:error, %Ecto.Changeset{}} = Notebook.create_item(user.id, %{"description" => nil, "user_id" => user.id})
    end

    test "update_item/2 with valid data updates the item", %{user: user} do
      item = item_fixture(%{"user_id" => user.id})
      update_attrs = %{description: "some updated description"}

      assert {:ok, %Item{} = item} = Notebook.update_item(item, update_attrs)
      assert item.description == "some updated description"
    end

    test "update_item/2 with invalid data returns error changeset", %{user: user} do
      item = item_fixture(%{"user_id" => user.id})
      assert {:error, %Ecto.Changeset{}} = Notebook.update_item(item, %{"description" => nil, "user_id" => user.id})
      assert item == Notebook.get_item!(item.id, user.id)
    end

    test "delete_item/1 deletes the item", %{user: user} do
      item = item_fixture(%{"user_id" => user.id})
      assert {:ok, %Item{}} = Notebook.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Notebook.get_item!(item.id, user.id) end
    end

    test "change_item/1 returns a item changeset", %{user: user} do
      item = item_fixture(%{"user_id" => user.id})
      assert %Ecto.Changeset{} = Notebook.change_item(item)
    end
  end
end
