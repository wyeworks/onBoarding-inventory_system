defmodule InventorySystem.ControlProducts.Service.ControlProducts do
  alias InventorySystem.Products.Service.ControlProductService
  alias InventorySystem.Products
  alias InventorySystem.Control_Products
  alias InventorySystem.Control_Products.Control_Product
  def control_products_in_reception(control__product_params) do

    IO.inspect(control__product_params, label: "Changeset is:")
    products = Products.filter_by_reception_id(control__product_params
    |> Map.get("reception_id"))
    |> control_list_prods()

    IO.inspect(products, label: "Changeset is:")

    Control_Products.create_control__product(control__product_params)
  end
  defp control_list_prods(list_prods) do
    list_prods
  |> Enum.map(&ControlProductService.control_product/1)
  end
end
