defmodule InventorySystem.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :amount_received, :integer
    field :amount_expected, :integer
    field :reception_id, :integer
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :amount_received, :amount_expected, :reception_id])
    |> validate_required([:name, :description, :amount_received, :amount_expected, :reception_id])
  end
end
