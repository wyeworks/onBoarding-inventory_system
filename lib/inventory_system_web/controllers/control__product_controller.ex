defmodule InventorySystemWeb.Control_ProductController do
  use InventorySystemWeb, :controller

  alias InventorySystem.ControlProducts.Service.ControlProducts
  alias InventorySystem.Control_Products
  alias InventorySystem.Control_Products.Control_Product

  action_fallback InventorySystemWeb.FallbackController

  def index(conn, _params) do
    control_products = Control_Products.list_control_products()
    render(conn, :index, control_products: control_products)
  end

  def create(conn, %{"control__product" => control__product_params}) do
    with {:ok, %Control_Product{} = control__product} <- ControlProducts.control_products_in_reception(control__product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/control_products/#{control__product}")
      |> render(:show, control__product: control__product)
    end
  end

  def show(conn, %{"id" => id}) do
    control__product = Control_Products.get_control__product!(id)
    render(conn, :show, control__product: control__product)
  end

  def update(conn, %{"id" => id, "control__product" => control__product_params}) do
    control__product = Control_Products.get_control__product!(id)

    with {:ok, %Control_Product{} = control__product} <- Control_Products.update_control__product(control__product, control__product_params) do
      render(conn, :show, control__product: control__product)
    end
  end

  def delete(conn, %{"id" => id}) do
    control__product = Control_Products.get_control__product!(id)

    with {:ok, %Control_Product{}} <- Control_Products.delete_control__product(control__product) do
      send_resp(conn, :no_content, "")
    end
  end
end
