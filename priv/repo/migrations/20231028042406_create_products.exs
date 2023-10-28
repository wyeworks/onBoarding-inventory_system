defmodule InventorySystem.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :text
      add :amount_recived, :integer
      add :amount_expected, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
