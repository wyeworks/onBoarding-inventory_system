defmodule InventorySystemWeb.ReceptionController do
  use InventorySystemWeb, :controller

  alias InventorySystem.Receptions
  alias InventorySystem.Receptions.Reception

  action_fallback InventorySystemWeb.FallbackController

  def index(conn, _params) do
    receptions = Receptions.list_receptions()
    render(conn, :index, receptions: receptions)
  end

  def create(conn, %{"reception" => reception_params}) do
    with {:ok, %Reception{} = reception} <- Receptions.create_reception(reception_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/receptions/#{reception}")
      |> render(:show, reception: reception)
    end
  end

  def show(conn, %{"id" => id}) do
    reception = Receptions.get_reception!(id)
    render(conn, :show, reception: reception)
  end

  def update(conn, %{"id" => id, "reception" => reception_params}) do
    reception = Receptions.get_reception!(id)

    with {:ok, %Reception{} = reception} <- Receptions.update_reception(reception, reception_params) do
      render(conn, :show, reception: reception)
    end
  end

  def delete(conn, %{"id" => id}) do
    reception = Receptions.get_reception!(id)

    with {:ok, %Reception{}} <- Receptions.delete_reception(reception) do
      send_resp(conn, :no_content, "")
    end
  end
end
