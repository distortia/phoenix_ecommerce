defmodule Store.AccountsTest do
  use Store.DataCase

  alias Store.Accounts

  describe "orders" do
    alias Store.Accounts.Order

    @valid_attrs %{items: []}
    @update_attrs %{items: []}
    @invalid_attrs %{items: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Accounts.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Accounts.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Accounts.create_order(@valid_attrs)
      assert order.items == []
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, order} = Accounts.update_order(order, @update_attrs)
      assert %Order{} = order
      assert order.items == []
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_order(order, @invalid_attrs)
      assert order == Accounts.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Accounts.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Accounts.change_order(order)
    end
  end

  describe "shopping_carts" do
    alias Store.Accounts.ShoppingCart

    @valid_attrs %{items: []}
    @update_attrs %{items: []}
    @invalid_attrs %{items: nil}

    def shopping_cart_fixture(attrs \\ %{}) do
      {:ok, shopping_cart} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_shopping_cart()

      shopping_cart
    end

    test "list_shopping_carts/0 returns all shopping_carts" do
      shopping_cart = shopping_cart_fixture()
      assert Accounts.list_shopping_carts() == [shopping_cart]
    end

    test "get_shopping_cart!/1 returns the shopping_cart with given id" do
      shopping_cart = shopping_cart_fixture()
      assert Accounts.get_shopping_cart!(shopping_cart.id) == shopping_cart
    end

    test "create_shopping_cart/1 with valid data creates a shopping_cart" do
      assert {:ok, %ShoppingCart{} = shopping_cart} = Accounts.create_shopping_cart(@valid_attrs)
      assert shopping_cart.items == []
    end

    test "create_shopping_cart/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_shopping_cart(@invalid_attrs)
    end

    test "update_shopping_cart/2 with valid data updates the shopping_cart" do
      shopping_cart = shopping_cart_fixture()
      assert {:ok, shopping_cart} = Accounts.update_shopping_cart(shopping_cart, @update_attrs)
      assert %ShoppingCart{} = shopping_cart
      assert shopping_cart.items == []
    end

    test "update_shopping_cart/2 with invalid data returns error changeset" do
      shopping_cart = shopping_cart_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_shopping_cart(shopping_cart, @invalid_attrs)
      assert shopping_cart == Accounts.get_shopping_cart!(shopping_cart.id)
    end

    test "delete_shopping_cart/1 deletes the shopping_cart" do
      shopping_cart = shopping_cart_fixture()
      assert {:ok, %ShoppingCart{}} = Accounts.delete_shopping_cart(shopping_cart)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_shopping_cart!(shopping_cart.id) end
    end

    test "change_shopping_cart/1 returns a shopping_cart changeset" do
      shopping_cart = shopping_cart_fixture()
      assert %Ecto.Changeset{} = Accounts.change_shopping_cart(shopping_cart)
    end
  end

  describe "users" do
    alias Store.Accounts.User

    @valid_attrs %{email: "some email", username: "some username"}
    @update_attrs %{email: "some updated email", username: "some updated username"}
    @invalid_attrs %{email: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
