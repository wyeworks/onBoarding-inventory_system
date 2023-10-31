defmodule InventorySystemWeb.Control_ProductControllerTest do
  use InventorySystemWeb.ConnCase

  import InventorySystem.Control_ProductsFixtures

  alias InventorySystem.Control_Products.Control_Product

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all control_products", %{conn: conn} do
      conn = get(conn, ~p"/api/control_products")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create control__product" do
    test "renders control__product when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/control_products", control__product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/control_products/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/control_products", control__product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update control__product" do
    setup [:create_control__product]

    test "renders control__product when data is valid", %{conn: conn, control__product: %Control_Product{id: id} = control__product} do
      conn = put(conn, ~p"/api/control_products/#{control__product}", control__product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/control_products/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, control__product: control__product} do
      conn = put(conn, ~p"/api/control_products/#{control__product}", control__product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete control__product" do
    setup [:create_control__product]

    test "deletes chosen control__product", %{conn: conn, control__product: control__product} do
      conn = delete(conn, ~p"/api/control_products/#{control__product}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/control_products/#{control__product}")
      end
    end
  end

  defp create_control__product(_) do
    control__product = control__product_fixture()
    %{control__product: control__product}
  end
end
