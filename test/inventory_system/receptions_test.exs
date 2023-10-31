defmodule InventorySystem.ReceptionsTest do
  use InventorySystem.DataCase

  alias InventorySystem.Receptions

  describe "receptions" do
    alias InventorySystem.Receptions.Reception

    import InventorySystem.ReceptionsFixtures

    @invalid_attrs %{nroRecep: nil}

    test "list_receptions/0 returns all receptions" do
      reception = reception_fixture()
      assert Receptions.list_receptions() == [reception]
    end

    test "get_reception!/1 returns the reception with given id" do
      reception = reception_fixture()
      assert Receptions.get_reception!(reception.id) == reception
    end

    test "create_reception/1 with valid data creates a reception" do
      valid_attrs = %{nroRecep: "some nroRecep"}

      assert {:ok, %Reception{} = reception} = Receptions.create_reception(valid_attrs)
      assert reception.nroRecep == "some nroRecep"
    end

    test "create_reception/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Receptions.create_reception(@invalid_attrs)
    end

    test "update_reception/2 with valid data updates the reception" do
      reception = reception_fixture()
      update_attrs = %{nroRecep: "some updated nroRecep"}

      assert {:ok, %Reception{} = reception} = Receptions.update_reception(reception, update_attrs)
      assert reception.nroRecep == "some updated nroRecep"
    end

    test "update_reception/2 with invalid data returns error changeset" do
      reception = reception_fixture()
      assert {:error, %Ecto.Changeset{}} = Receptions.update_reception(reception, @invalid_attrs)
      assert reception == Receptions.get_reception!(reception.id)
    end

    test "delete_reception/1 deletes the reception" do
      reception = reception_fixture()
      assert {:ok, %Reception{}} = Receptions.delete_reception(reception)
      assert_raise Ecto.NoResultsError, fn -> Receptions.get_reception!(reception.id) end
    end

    test "change_reception/1 returns a reception changeset" do
      reception = reception_fixture()
      assert %Ecto.Changeset{} = Receptions.change_reception(reception)
    end
  end
end
