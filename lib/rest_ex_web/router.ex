defmodule RestExWeb.Router do
  use RestExWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RestExWeb do
    pipe_through :api
  end
end
