defmodule RestEx.EntityTest do
  use ExUnit.Case, async: true

  defmodule Entity do
    use RestEx.Entity

    schema "my entity" do
      field(:username, :string)
      field(:password, :string)
    end
  end

  test "inspects metadata Ecto.Schama" do
    assert inspect(%Entity{}.__meta__) == "#Ecto.Schema.Metadata<:built, \"my entity\">"
  end
end
