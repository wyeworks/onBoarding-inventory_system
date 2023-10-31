defmodule InventorySystem.Control_ProductsTest do
  use InventorySystem.DataCase

  alias InventorySystem.Control_Products

  describe "control_products" do
    alias InventorySystem.Control_Products.Control_Product

    import InventorySystem.Control_ProductsFixtures

    @invalid_attrs %{}

    test "list_control_products/0 returns all control_products" do
      control__product = control__product_fixture()
      assert Control_Products.list_control_products() == [control__product]
    end

    test "get_control__product!/1 returns the control__product with given id" do
      control__product = control__product_fixture()
      assert Control_Products.get_control__product!(control__product.id) == control__product
    end

    test "create_control__product/1 with valid data creates a control__product" do
      valid_attrs = %{}

      assert {:ok, %Control_Product{} = control__product} = Control_Products.create_control__product(valid_attrs)
    end

    test "create_control__product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Control_Products.create_control__product(@invalid_attrs)
    end

    test "update_control__product/2 with valid data updates the control__product" do
      control__product = control__product_fixture()
      update_attrs = %{}

      assert {:ok, %Control_Product{} = control__product} = Control_Products.update_control__product(control__product, update_attrs)
    end

    test "update_control__product/2 with invalid data returns error changeset" do
      control__product = control__product_fixture()
      assert {:error, %Ecto.Changeset{}} = Control_Products.update_control__product(control__product, @invalid_attrs)
      assert control__product == Control_Products.get_control__product!(control__product.id)
    end

    test "delete_control__product/1 deletes the control__product" do
      control__product = control__product_fixture()
      assert {:ok, %Control_Product{}} = Control_Products.delete_control__product(control__product)
      assert_raise Ecto.NoResultsError, fn -> Control_Products.get_control__product!(control__product.id) end
    end

    test "change_control__product/1 returns a control__product changeset" do
      control__product = control__product_fixture()
      assert %Ecto.Changeset{} = Control_Products.change_control__product(control__product)
    end
  end
end
