defmodule ControlFinancerServer.Banks.CreditCard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credit_cards" do
    field :name, :string
    field :limit, :float
    field :closing_day, :utc_datetime
    field :expiration_day, :utc_datetime
    belongs_to :bank_id, ControlFinancerServer.Banks.Bank
    belongs_to :account_bank_id, ControlFinancerServer.Banks.AccountBank
    belongs_to :user_id, ControlFinancerServer.Account.User

    timestamps()
  end

  @doc false
  def changeset(credit_card, attrs) do
    credit_card
    |> cast(attrs, [:name, :limit, :closing_day, :expiration_day, :bank_id, :account_bank_id, :user_id])
    |> validate_required([:name, :limit, :closing_day, :expiration_day, :user_id])
  end
end
