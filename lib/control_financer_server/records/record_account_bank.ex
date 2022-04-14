defmodule ControlFinancerServer.Records.RecordAccountBank do
  use Ecto.Schema
  import Ecto.Changeset

  schema "record_account_banks" do
    field :description, :string
    field :value, :float
    field :payment_date, :utc_datetime
    belongs_to :category_id, ControlFinancerServer.Utils.Category
    belongs_to :user_id, ControlFinancerServer.Account.User
    belongs_to :account_bank_id, ControlFinancerServer.Banks.AccountBank

    timestamps()
  end

  @doc false
  def changeset(record_account_bank, attrs) do
    record_account_bank
    |> cast(attrs, [:description, :value, :payment_date, :category_id, :user_id, :account_bank_id])
    |> validate_required([:description, :value, :payment_date, :user_id, :account_bank_id])
  end
end
