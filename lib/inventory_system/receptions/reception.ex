defmodule InventorySystem.Receptions.Reception do
  use Ecto.Schema
  import Ecto.Changeset
  alias InventorySystem.Products.Product
  schema "receptions" do
    field :nroRecep, :string
    has_many :products, Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(reception, attrs) do
    reception
    |> cast(attrs, [:nroRecep])
    |> validate_required([:nroRecep])
  end
end
