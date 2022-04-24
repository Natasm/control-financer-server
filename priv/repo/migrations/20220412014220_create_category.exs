defmodule ControlFinancerServer.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string, null: false
      add :type, :integer, values: [expenditure: 1, revenue: 2]
      add :predictValue, :float, default: 0.0
      add :user_id, references(:users), null: false

      timestamps()
    end
  end
end
