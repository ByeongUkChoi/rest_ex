defmodule RestEx.SchemaTest do
  use ExUnit.Case, async: true

  defmodule User do
    use RestEx.Entity

    schema "users" do
      field(:username, :string)
      field(:password, :string)
    end
  end

  test "inspects metadata Ecto.Schama" do
    assert inspect(%User{}.__meta__) == "#Ecto.Schema.Metadata<:built, \"users\">"
  end
end
