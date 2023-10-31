defmodule InventorySystem.Control_Products do
  @moduledoc """
  The Control_Products context.
  """

  import Ecto.Query, warn: false
  alias InventorySystem.Repo

  alias InventorySystem.Control_Products.Control_Product

  @doc """
  Returns the list of control_products.

  ## Examples

      iex> list_control_products()
      [%Control_Product{}, ...]

  """
  def list_control_products do
    Repo.all(Control_Product)
  end

  @doc """
  Gets a single control__product.

  Raises `Ecto.NoResultsError` if the Control  product does not exist.

  ## Examples

      iex> get_control__product!(123)
      %Control_Product{}

      iex> get_control__product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_control__product!(id), do: Repo.get!(Control_Product, id)

  @doc """
  Creates a control__product.

  ## Examples

      iex> create_control__product(%{field: value})
      {:ok, %Control_Product{}}

      iex> create_control__product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_control__product(attrs \\ %{}) do
    %Control_Product{}
    |> Control_Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a control__product.

  ## Examples

      iex> update_control__product(control__product, %{field: new_value})
      {:ok, %Control_Product{}}

      iex> update_control__product(control__product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_control__product(%Control_Product{} = control__product, attrs) do
    control__product
    |> Control_Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a control__product.

  ## Examples

      iex> delete_control__product(control__product)
      {:ok, %Control_Product{}}

      iex> delete_control__product(control__product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_control__product(%Control_Product{} = control__product) do
    Repo.delete(control__product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking control__product changes.

  ## Examples

      iex> change_control__product(control__product)
      %Ecto.Changeset{data: %Control_Product{}}

  """
  def change_control__product(%Control_Product{} = control__product, attrs \\ %{}) do
    Control_Product.changeset(control__product, attrs)
  end
end
