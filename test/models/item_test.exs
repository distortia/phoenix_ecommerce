defmodule Store.ItemTest do
  use Store.ModelCase

  alias Store.Item

  @valid_attrs %{available: true, description: "some description", image: "some image", name: "some name", price: 120.5, quantity: 42, sale_price: 120.5}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Item.changeset(%Item{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Item.changeset(%Item{}, @invalid_attrs)
    refute changeset.valid?
  end
end
