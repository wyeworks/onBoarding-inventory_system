defmodule InventorySystem.Repo.Migrations.CreateControlProducts do
  use Ecto.Migration

  def change do
    create table(:control_products) do
      add :reception_id, references(:receptions, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:control_products, [:reception_id])
  end
end
