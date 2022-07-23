defmodule RestEx.RouteTest do
  use ExUnit.Case, async: true

  # TOOD: remove module
  defmodule UserController do
    use Phoenix.Controller
    def show(conn, _params), do: text(conn, "show users")
    def index(conn, _params), do: text(conn, "index users")
    def new(conn, _params), do: text(conn, "new users")
    def edit(conn, _params), do: text(conn, "edit users")
    def create(conn, _params), do: text(conn, "create users")
    def update(conn, _params), do: text(conn, "update users")
    def delete(conn, _params), do: text(conn, "delete users")
  end

  defmodule Router do
    use Phoenix.Router

    resources "/users", UserController
  end

  defmodule User do
    use RestEx.Entity

    entity "users" do
      field(:username, :string)
      field(:password, :string)
    end
  end

  test "toplevel route matches index action" do
    import Plug.Test

    conn =
      conn(:get, "/users", nil)
      |> Router.call(Router.init([]))

    assert conn.status == 200
    assert conn.resp_body == "index users"
  end
end
