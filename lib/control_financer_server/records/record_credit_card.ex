defmodule ControlFinancerServer.Records.RecordCreditCard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "record_credit_cards" do
    field :description, :string
    field :value, :float
    field :payment_date, :utc_datetime
    belongs_to :category_id, ControlFinancerServer.Utils.Category
    belongs_to :user_id, ControlFinancerServer.Account.User
    belongs_to :credit_card_id, ControlFinancerServer.Banks.CreditCard

    timestamps()
  end

  @doc false
  def changeset(record_credit_card, attrs) do
    record_credit_card
    |> cast(attrs, [:description, :value, :payment_date, :category_id, :user_id, :credit_card_id])
    |> validate_required([:description, :value, :payment_date, :user_id, :credit_card_id])
  end
end
