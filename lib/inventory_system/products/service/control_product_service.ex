defmodule InventorySystem.Products.Service.ControlProductService do

  alias InventorySystem.Products

  def control_product(id) do
    Products.get_product!(id)
    |> control_amount()
  end

  defp control_amount(product) do
        cond do
          product.amount_received == product.amount_expected ->
            IO.puts("the product has been controlled successfully")
            product.amount_received != product.amount_expected ->
              IO.puts("the amount has differences")
        end
  end

end
