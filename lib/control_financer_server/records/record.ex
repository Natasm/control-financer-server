defmodule ControlFinancerServer.Records.Record do
  use Ecto.Schema
  import Ecto.Changeset

  schema "records" do
    field :description, :string
    belongs_to :category, ControlFinancerServer.Utils.Category
    belongs_to :user, ControlFinancerServer.Account.User

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:description, :category, :user])
    |> validate_required([:description, :user])
  end
end
