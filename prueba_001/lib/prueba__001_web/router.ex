defmodule Prueba001Web.Router do
  use Prueba001Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Prueba001Web do
    pipe_through :api
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:prueba__001, :dev_routes) do

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
