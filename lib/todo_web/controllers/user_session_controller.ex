defmodule TodoWeb.UserSessionController do
  use TodoWeb, :controller

  alias Todo.Accounts
  alias TodoWeb.UserAuth

  plug :put_layout, {TodoWeb.LayoutView, "auth_form.html"}

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil, title: "Log in")
  end

  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    if user = Accounts.get_user_by_email_and_password(email, password) do
      UserAuth.log_in_user(conn, user, user_params)
    else
      # In order to prevent user enumeration attacks, don't disclose whether the email is registered.
      render(conn, "new.html", error_message: "Invalid email or password", title: "Log in")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end
end
