defmodule ControlFinancerServer.Utils.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    field :type, :integer

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
  end
end
