defmodule InventorySystem.ReceptionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InventorySystem.Receptions` context.
  """

  @doc """
  Generate a reception.
  """
  def reception_fixture(attrs \\ %{}) do
    {:ok, reception} =
      attrs
      |> Enum.into(%{
        nroRecep: "some nroRecep"
      })
      |> InventorySystem.Receptions.create_reception()

    reception
  end
end
