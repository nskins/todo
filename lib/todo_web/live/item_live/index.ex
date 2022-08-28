defmodule TodoWeb.ItemLive.Index do
  use TodoWeb, :live_view

  alias Todo.Notebook
  alias Todo.Notebook.Item

  @impl true
  def mount(_params, _session, socket) do
    user_id = socket.assigns.current_user.id

    {:ok, assign(socket, :items, list_items(user_id))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Item")
    |> assign(:item, Notebook.get_item!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Item")
    |> assign(:item, %Item{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Items")
    |> assign(:item, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    item = Notebook.get_item!(id)
    {:ok, _} = Notebook.delete_item(item)

    user_id = socket.assigns.current_user.id

    {:noreply, assign(socket, :items, list_items(user_id))}
  end

  defp list_items(user_id) do
    Notebook.list_items_by_user(user_id)
  end
end
