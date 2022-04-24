defmodule ControlFinancerServer.Repo.Migrations.CreateCreditCards do
  use Ecto.Migration

  def change do
    create table(:credit_cards) do
      add :name, :string, null: false
      add :limit, :float, default: 0.0, null: false
      add :closing_day, :utc_datetime, null: false
      add :expiration_day, :utc_datetime, null: false
      add :bank_id, references(:banks)
      add :account_bank_id, references(:account_banks)
      add :user_id, references(:users), null: false

      timestamps()
    end
  end
end
