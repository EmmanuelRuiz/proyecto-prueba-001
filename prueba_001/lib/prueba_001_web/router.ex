defmodule Prueba001Web.Router do
  use Prueba001Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Prueba001Web do
    pipe_through :api
    get "/", DefaultController, :index
  end
end
