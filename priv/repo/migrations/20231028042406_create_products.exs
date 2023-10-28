defmodule InventorySystem.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :text
      add :amount_received, :integer
      add :amount_expected, :integer
      add :reception_id, references(:receptions)

      timestamps(type: :utc_datetime)
    end
  end
end
