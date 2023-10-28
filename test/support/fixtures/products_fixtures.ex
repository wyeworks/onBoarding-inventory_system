defmodule InventorySystem.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InventorySystem.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        amount_expected: 42,
        amount_recived: 42,
        description: "some description",
        name: "some name"
      })
      |> InventorySystem.Products.create_product()

    product
  end
end
