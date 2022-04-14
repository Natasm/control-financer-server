defmodule ControlFinancerServer.Repo do
  use Ecto.Repo,
    otp_app: :control_financer_server,
    adapter: Ecto.Adapters.Postgres
end
