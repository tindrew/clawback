defmodule Clawback.Repo do
  use Ecto.Repo,
    otp_app: :clawback,
    adapter: Ecto.Adapters.Postgres
end
