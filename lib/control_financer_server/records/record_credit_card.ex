defmodule ControlFinancerServer.Records.RecordCreditCard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "record_credit_cards" do
    field :description, :string
    belongs_to :category, ControlFinancerServer.Utils.Category
    belongs_to :user, ControlFinancerServer.Account.User

    belongs_to :credit_card, ControlFinancerServer.Banks.CreditCard
    field :value, :float
    field :payment_date, :utc_datetime
    field :status, :string
    field :equivalent_parcel_number, :integer

    belongs_to :record_credit_card_parcel, ControlFinancerServer.Records.RecordCreditCardParcel

    timestamps()
  end

  @doc false
  def changeset(record_credit_card, attrs) do
    record_credit_card
    |> cast(attrs, [:description, :value, :payment_date, :category_id, :user_id, :credit_card_id, :value, :payment_date, :status, :equivalent_parcel_number, :record_credit_card_parcel_id])
    |> validate_required([:description, :user_id, :credit_card_id, :value, :payment_date, :equivalent_parcel_number])
  end
end
