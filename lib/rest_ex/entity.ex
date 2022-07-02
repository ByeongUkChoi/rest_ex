defmodule RestEx.Entity do
  @moduledoc """

  ## Example

      defmodule User do
        use RestEx.Entity

        schema "users" do
          field :name, :string
          field :age, :integer, default: 0
          field :password, :string, redact: true
        end
      end
  """
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      use Phoenix.Router
    end
  end
end
