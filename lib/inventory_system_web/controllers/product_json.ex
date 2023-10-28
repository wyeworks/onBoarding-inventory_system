defmodule InventorySystemWeb.ProductJSON do
  alias InventorySystem.Products.Product

  @doc """
  Renders a list of products.
  """
  def index(%{products: products}) do
    %{data: for(product <- products, do: data(product))}
  end

  @doc """
  Renders a single product.
  """
  def show(%{product: product}) do
    %{data: data(product)}
  end

  defp data(%Product{} = product) do
    %{
      id: product.id,
      name: product.name,
      description: product.description,
      amount_recived: product.amount_recived,
      amount_expected: product.amount_expected,
      reception_id: product.reception_id
    }
  end
end
