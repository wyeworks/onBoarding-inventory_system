defmodule InventorySystem.Repo.Migrations.CreateReceptions do
  use Ecto.Migration

  def change do
    create table(:receptions) do
      add :nroRecep, :string

      timestamps(type: :utc_datetime)
    end
  end
end
