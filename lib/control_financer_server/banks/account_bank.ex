defmodule ControlFinancerServer.Banks.AccountBank do
  use Ecto.Schema
  import Ecto.Changeset

  schema "account_banks" do
    field :name, :string
    field :balance, :float
    belongs_to :bank_id, ControlFinancerServer.Banks.Bank
    belongs_to :user_id, ControlFinancerServer.Account.User

    timestamps()
  end

  @doc false
  def changeset(account_bank, attrs) do
    account_bank
    |> cast(attrs, [:name, :balance, :bank_id, :user_id])
    |> validate_required([:name, :balance, :bank_id, :user_id])
  end
end
