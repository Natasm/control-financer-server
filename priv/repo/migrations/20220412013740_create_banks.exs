defmodule ControlFinancerServer.Repo.Migrations.CreateBanks do
  use Ecto.Migration

  def change do
    create table(:banks) do
      add :name, :string, null: false

      timestamps([type: :utc_datetime])
    end
  end
end
