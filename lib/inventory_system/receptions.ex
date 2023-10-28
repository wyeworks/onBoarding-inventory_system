defmodule InventorySystem.Receptions do
  @moduledoc """
  The Receptions context.
  """

  import Ecto.Query, warn: false
  alias InventorySystem.Repo

  alias InventorySystem.Receptions.Reception

  @doc """
  Returns the list of receptions.

  ## Examples

      iex> list_receptions()
      [%Reception{}, ...]

  """
  def list_receptions do
    Repo.all(Reception)
  end

  @doc """
  Gets a single reception.

  Raises `Ecto.NoResultsError` if the Reception does not exist.

  ## Examples

      iex> get_reception!(123)
      %Reception{}

      iex> get_reception!(456)
      ** (Ecto.NoResultsError)

  """
  def get_reception!(id), do: Repo.get!(Reception, id)

  @doc """
  Creates a reception.

  ## Examples

      iex> create_reception(%{field: value})
      {:ok, %Reception{}}

      iex> create_reception(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_reception(attrs \\ %{}) do
    %Reception{}
    |> Reception.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a reception.

  ## Examples

      iex> update_reception(reception, %{field: new_value})
      {:ok, %Reception{}}

      iex> update_reception(reception, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_reception(%Reception{} = reception, attrs) do
    reception
    |> Reception.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a reception.

  ## Examples

      iex> delete_reception(reception)
      {:ok, %Reception{}}

      iex> delete_reception(reception)
      {:error, %Ecto.Changeset{}}

  """
  def delete_reception(%Reception{} = reception) do
    Repo.delete(reception)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking reception changes.

  ## Examples

      iex> change_reception(reception)
      %Ecto.Changeset{data: %Reception{}}

  """
  def change_reception(%Reception{} = reception, attrs \\ %{}) do
    Reception.changeset(reception, attrs)
  end
end
