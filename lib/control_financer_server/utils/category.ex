defmodule ControlFinancerServer.Utils.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    field :type, :integer
    field :predictValue, :float
    belongs_to :user, ControlFinancerServer.Account.User

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :type, :predictValue, :user_id])
    |> validate_required([:name, :type, :predictValue, :user_id])
  end
end
