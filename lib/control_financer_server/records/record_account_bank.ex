defmodule ControlFinancerServer.Records.RecordAccountBank do
  use Ecto.Schema
  import Ecto.Changeset

  schema "record_account_banks" do
    field :description, :string
    field :date, :utc_datetime
    belongs_to :category, ControlFinancerServer.Utils.Category
    belongs_to :user, ControlFinancerServer.Account.User

    belongs_to :account_bank, ControlFinancerServer.Banks.AccountBank
    field :value, :float
    field :payment_date, :utc_datetime
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(record_account_bank, attrs) do
    record_account_bank
    |> cast(attrs, [:description, :date, :category_id, :user_id, :account_bank_id, :value, :payment_date, :status])
    |> validate_required([:description, :date, :user_id, :account_bank_id, :value, :payment_date])
  end
end
