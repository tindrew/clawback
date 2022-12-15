defmodule Clawback.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Clawback.Repo,
      # Start the Telemetry supervisor
      ClawbackWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Clawback.PubSub},
      # Start the Endpoint (http/https)
      ClawbackWeb.Endpoint
      # Start a worker by calling: Clawback.Worker.start_link(arg)
      # {Clawback.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Clawback.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ClawbackWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
