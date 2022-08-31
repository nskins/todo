defmodule TodoWeb.ItemLive.Show do
  use TodoWeb, :live_view

  alias Todo.Notebook

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    user_id = socket.assigns.current_user.id

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:item, Notebook.get_item!(id, user_id))}
  end

  defp page_title(:show), do: "Show Item"
  defp page_title(:edit), do: "Edit Item"
end
