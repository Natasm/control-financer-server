defmodule ControlFinancerServer.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string, null: false
      add :type, :integer, values: [expenditure: 1, revenue: 2]

      timestamps([type: :utc_datetime])
    end
  end
end
