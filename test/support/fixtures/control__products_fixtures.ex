defmodule InventorySystem.Control_ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InventorySystem.Control_Products` context.
  """

  @doc """
  Generate a control__product.
  """
  def control__product_fixture(attrs \\ %{}) do
    {:ok, control__product} =
      attrs
      |> Enum.into(%{

      })
      |> InventorySystem.Control_Products.create_control__product()

    control__product
  end
end
