defmodule InventorySystem.Control_Products.Control_Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "control_products" do

    field :reception_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(control__product, attrs) do
    control__product
    |> cast(attrs, [:reception_id])
    |> validate_required([:reception_id])
  end
end
