defmodule ControlFinancerServer.Repo.Migrations.CreateRecords do
  use Ecto.Migration

  def change do
    create table(:records) do
      add :description, :string, null: false
      add :date, :utc_datetime, null: false
      add :category_id, references(:categories)
      add :user_id, references(:users), null: false

      timestamps([type: :utc_datetime])
    end

    create table(:record_account_banks, options: "INHERITS (records)") do
      add :account_bank_id, references(:account_banks), null: false
      add :value, :float, null: false, default: 0.0
      add :payment_date, :utc_datetime, null: false
      add :status, :string
    end

    create table(:record_credit_cards, options: "INHERITS (records)") do
      add :credit_card_id, references(:credit_cards), null: false
      add :value, :float, null: false, default: 0.0
      add :payment_date, :utc_datetime, null: false
      add :status, :string
      add :number_of_times, :integer, null: false
      add :equivalent_installment_number, :integer, null: false
    end 
  end
end
