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
      import RestEx.Entity, only: [entity: 2]
    end
  end

  defmacro entity(source, do: block) do
    quote do
      use Ecto.Schema

      schema(unquote(source), do: unquote(block))
    end
  end
end
