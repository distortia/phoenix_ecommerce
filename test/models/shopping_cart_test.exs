defmodule Store.ShoppingCartTest do
  use Store.ModelCase

  alias Store.ShoppingCart

  @valid_attrs %{items: []}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ShoppingCart.changeset(%ShoppingCart{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ShoppingCart.changeset(%ShoppingCart{}, @invalid_attrs)
    refute changeset.valid?
  end
end
