defmodule InventorySystemWeb.ReceptionControllerTest do
  use InventorySystemWeb.ConnCase

  import InventorySystem.ReceptionsFixtures

  alias InventorySystem.Receptions.Reception

  @create_attrs %{
    nroRecep: "some nroRecep"
  }
  @update_attrs %{
    nroRecep: "some updated nroRecep"
  }
  @invalid_attrs %{nroRecep: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all receptions", %{conn: conn} do
      conn = get(conn, ~p"/api/receptions")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create reception" do
    test "renders reception when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/receptions", reception: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/receptions/#{id}")

      assert %{
               "id" => ^id,
               "nroRecep" => "some nroRecep"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/receptions", reception: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update reception" do
    setup [:create_reception]

    test "renders reception when data is valid", %{conn: conn, reception: %Reception{id: id} = reception} do
      conn = put(conn, ~p"/api/receptions/#{reception}", reception: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/receptions/#{id}")

      assert %{
               "id" => ^id,
               "nroRecep" => "some updated nroRecep"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, reception: reception} do
      conn = put(conn, ~p"/api/receptions/#{reception}", reception: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete reception" do
    setup [:create_reception]

    test "deletes chosen reception", %{conn: conn, reception: reception} do
      conn = delete(conn, ~p"/api/receptions/#{reception}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/receptions/#{reception}")
      end
    end
  end

  defp create_reception(_) do
    reception = reception_fixture()
    %{reception: reception}
  end
end
