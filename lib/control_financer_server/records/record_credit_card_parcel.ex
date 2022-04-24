defmodule ControlFinancerServer.Records.RecordCreditCardParcel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "record_credit_card_parcels" do
    field :number_of_times, :integer
    has_many :record_credit_cards, ControlFinancerServer.Records.RecordCreditCard

    timestamps()
  end

  @doc false
  def changeset(record_credit_card_parcel, attrs) do
    record_credit_card_parcel
    |> cast(attrs, [:number_of_times])
    |> validate_required([:number_of_times])
  end
end
