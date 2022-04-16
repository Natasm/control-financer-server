defmodule ControlFinancerServer.Records.RecordCreditCard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "record_credit_cards" do
    field :description, :string
    field :date, :utc_datetime
    belongs_to :category, ControlFinancerServer.Utils.Category
    belongs_to :user, ControlFinancerServer.Account.User

    belongs_to :credit_card, ControlFinancerServer.Banks.CreditCard
    field :value, :float
    field :payment_date, :utc_datetime
    field :status, :string
    field :number_of_times, :integer
    field :equivalent_installment_number, :integer

    timestamps()
  end

  @doc false
  def changeset(record_credit_card, attrs) do
    record_credit_card
    |> cast(attrs, [:description, :date, :value, :payment_date, :category_id, :user_id, :credit_card_id, :value, :payment_date, :status, :number_of_times, :equivalent_installment_number])
    |> validate_required([:description, :date, :user_id, :credit_card_id, :value, :payment_date, :number_of_times, :equivalent_installment_number])
  end
end
