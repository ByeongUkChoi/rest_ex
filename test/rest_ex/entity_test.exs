defmodule RestEx.EntityTest do
  defmodule Schema do
    use RestEx.Entity

    schema "my schema" do
      field(:username, :string)
      field(:password, :string)
    end
  end
end
