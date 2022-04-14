defmodule ControlFinancerServer.Repo.Migrations.CreateAccountBank do
  use Ecto.Migration

  def change do
    create table(:account_banks) do
      add :name, :string, null: false
      add :balance, :float, default: 0.0
      add :bank_id, references(:banks), null: false
      add :user_id, references(:users), null: false

      timestamps([type: :utc_datetime])
    end
  end
end
