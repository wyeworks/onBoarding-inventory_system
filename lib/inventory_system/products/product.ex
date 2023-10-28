defmodule InventorySystem.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :amount_recived, :integer
    field :amount_expected, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :amount_recived, :amount_expected])
    |> validate_required([:name, :description, :amount_recived, :amount_expected])
  end
end
