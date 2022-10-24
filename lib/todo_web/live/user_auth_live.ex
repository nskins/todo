defmodule TodoWeb.UserAuthLive do
  import Phoenix.LiveView
  alias Todo.Accounts

  def on_mount(:user, _params, %{"user_token" => user_token} = _session, socket) do
    socket =
      socket
      |> assign(:current_user, Accounts.get_user_by_session_token(user_token))

    if socket.assigns.current_user do
      {:cont, socket}
    else
      # Maybe we can use the route helpers instead of hardcoding the path.
      {:halt, redirect(socket, to: "/")}
    end
  end
end
