defmodule RestEx.RouterTest do
  defmodule Sample do
    use Plug.Router
    use Plug.ErrorHandler

    plug :match
    plug :dispatch

    get "/" do
      resp(conn, 200, "root")
    end
  end

  use ExUnit.Case, async: true
  use Plug.Test

  test "dispatch root" do
    conn = call(Sample, conn(:get, "/"))
    assert conn.resp_body == "root"
  end

  defp call(mod, conn) do
    mod.call(conn, [])
  end
end
