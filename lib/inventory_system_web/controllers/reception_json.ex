defmodule InventorySystemWeb.ReceptionJSON do
  alias InventorySystem.Receptions.Reception

  @doc """
  Renders a list of receptions.
  """
  def index(%{receptions: receptions}) do
    %{data: for(reception <- receptions, do: data(reception))}
  end

  @doc """
  Renders a single reception.
  """
  def show(%{reception: reception}) do
    %{data: data(reception)}
  end

  defp data(%Reception{} = reception) do
    %{
      id: reception.id,
      nroRecep: reception.nroRecep
    }
  end
end
