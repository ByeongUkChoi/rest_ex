defmodule RestEx.RouteTest do
  use ExUnit.Case, async: true

  defmodule User do
    use RestEx.Entity

    schema "users" do
      field(:username, :string)
      field(:password, :string)
    end
  end

  test "toplevel route matches index action" do
    conn = call(Router, :get, "/users")
    # assert conn.status == 200
    # assert conn.resp_body == "index users"
  end
end
