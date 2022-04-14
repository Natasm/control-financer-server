defmodule ControlFinancerServer.Records.Record do
  use Ecto.Schema
  import Ecto.Changeset

  schema "records" do
    field :description, :string
    field :value, :float
    field :payment_date, :utc_datetime
    belongs_to :category_id, ControlFinancerServer.Utils.Category
    belongs_to :user_id, ControlFinancerServer.Account.User

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:description, :value, :payment_date, :category_id, :user_id])
    |> validate_required([:description, :value, :payment_date, :user_id])
  end
end
