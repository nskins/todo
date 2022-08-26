defmodule Todo.NotebookTest do
  use Todo.DataCase

  alias Todo.Notebook

  describe "items" do
    alias Todo.Notebook.Item

    import Todo.NotebookFixtures

    @invalid_attrs %{description: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Notebook.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Notebook.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{description: "some description"}

      assert {:ok, %Item{} = item} = Notebook.create_item(valid_attrs)
      assert item.description == "some description"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notebook.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{description: "some updated description"}

      assert {:ok, %Item{} = item} = Notebook.update_item(item, update_attrs)
      assert item.description == "some updated description"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Notebook.update_item(item, @invalid_attrs)
      assert item == Notebook.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Notebook.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Notebook.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Notebook.change_item(item)
    end
  end
end
