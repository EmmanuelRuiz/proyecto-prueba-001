defmodule Prueba001.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Prueba001Web.Telemetry,
      # Start the Ecto repository
      Prueba001.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Prueba001.PubSub},
      # Start the Endpoint (http/https)
      Prueba001Web.Endpoint
      # Start a worker by calling: Prueba001.Worker.start_link(arg)
      # {Prueba001.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Prueba001.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Prueba001Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
