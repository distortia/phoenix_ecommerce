defmodule Store.ItemsTest do
  use Store.DataCase

  alias Store.Items

  describe "items" do
    alias Store.Items.Item

    @valid_attrs %{available: true, description: "some description", image: "some image", name: "some name", price: 120.5, quantity: 42, sale_price: 120.5}
    @update_attrs %{available: false, description: "some updated description", image: "some updated image", name: "some updated name", price: 456.7, quantity: 43, sale_price: 456.7}
    @invalid_attrs %{available: nil, description: nil, image: nil, name: nil, price: nil, quantity: nil, sale_price: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Items.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Items.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Items.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Items.create_item(@valid_attrs)
      assert item.available == true
      assert item.description == "some description"
      assert item.image == "some image"
      assert item.name == "some name"
      assert item.price == 120.5
      assert item.quantity == 42
      assert item.sale_price == 120.5
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Items.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.available == false
      assert item.description == "some updated description"
      assert item.image == "some updated image"
      assert item.name == "some updated name"
      assert item.price == 456.7
      assert item.quantity == 43
      assert item.sale_price == 456.7
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_item(item, @invalid_attrs)
      assert item == Items.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Items.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Items.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Items.change_item(item)
    end
  end
end
