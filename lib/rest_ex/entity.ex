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
      # use Ecto.Schema
      # use Phoenix.Router
      import RestEx.Entity, only: [entity: 2]
    end
  end

  defmacro entity(source, do: block) do
    quote do
      use Ecto.Schema
      use Phoenix.Router

      @controller_module MacroController

      contents =
        quote do
          def init(_), do: true
        end

      Module.create(@controller_module, contents, Macro.Env.location(__ENV__))

      resources("/" <> unquote(source), @controller_module)
      schema(unquote(source), do: unquote(block))
    end
  end
end
