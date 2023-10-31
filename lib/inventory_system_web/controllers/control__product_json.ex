defmodule InventorySystemWeb.Control_ProductJSON do
  alias InventorySystem.Control_Products.Control_Product

  @doc """
  Renders a list of control_products.
  """
  def index(%{control_products: control_products}) do
    %{data: for(control__product <- control_products, do: data(control__product))}
  end

  @doc """
  Renders a single control__product.
  """
  def show(%{control__product: control__product}) do
    %{data: data(control__product)}
  end

  defp data(%Control_Product{} = control__product) do
    %{
      id: control__product.id
    }
  end
end
