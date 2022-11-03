defmodule TodoWeb.ItemLive.Index do
  use TodoWeb, :live_view

  alias Todo.Notebook
  alias Todo.Notebook.Item

  @impl true
  def mount(_params, _session, socket) do
    user_id = socket.assigns.current_user.id

    if connected?(socket), do: Notebook.subscribe(user_id)

    local_date = Timex.local() |> Timex.to_date()

    socket =
      socket
      |> assign(:local_date, local_date)
      |> assign(:items, list_items(user_id))

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    user_id = socket.assigns.current_user.id

    socket
    |> assign(:page_title, "Edit Item")
    |> assign(:item, Notebook.get_item!(id, user_id))
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
    user_id = socket.assigns.current_user.id

    item = Notebook.get_item!(id, user_id)
    {:ok, _} = Notebook.delete_item(user_id, item)

    {:noreply, socket}
  end

  @impl true
  def handle_info({:item_created, user_id}, socket) do
    {:noreply, update(socket, :items, fn _ -> list_items(user_id) end)}
  end

  def handle_info({:item_updated, user_id}, socket) do
    {:noreply, update(socket, :items, fn _ -> list_items(user_id) end)}
  end

  def handle_info({:item_deleted, user_id}, socket) do
    {:noreply, update(socket, :items, fn _ -> list_items(user_id) end)}
  end

  defp list_items(user_id) do
    Notebook.list_items_by_user(user_id)
  end
end
