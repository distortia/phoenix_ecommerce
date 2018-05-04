defmodule StoreWeb.ShoppingCartController do
  use StoreWeb, :controller

  alias Store.Accounts
  alias Store.Accounts.ShoppingCart

  def index(conn, _params) do
    shopping_carts = Accounts.list_shopping_carts()
    render(conn, "index.html", shopping_carts: shopping_carts)
  end

  def new(conn, _params) do
    changeset = Accounts.change_shopping_cart(%ShoppingCart{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"shopping_cart" => shopping_cart_params}) do
    case Accounts.create_shopping_cart(shopping_cart_params) do
      {:ok, shopping_cart} ->
        conn
        |> put_flash(:info, "Shopping cart created successfully.")
        |> redirect(to: shopping_cart_path(conn, :show, shopping_cart))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    shopping_cart = Accounts.get_shopping_cart!(id)
    render(conn, "show.html", shopping_cart: shopping_cart)
  end

  def edit(conn, %{"id" => id}) do
    shopping_cart = Accounts.get_shopping_cart!(id)
    changeset = Accounts.change_shopping_cart(shopping_cart)
    render(conn, "edit.html", shopping_cart: shopping_cart, changeset: changeset)
  end

  def update(conn, %{"id" => id, "shopping_cart" => shopping_cart_params}) do
    shopping_cart = Accounts.get_shopping_cart!(id)

    case Accounts.update_shopping_cart(shopping_cart, shopping_cart_params) do
      {:ok, shopping_cart} ->
        conn
        |> put_flash(:info, "Shopping cart updated successfully.")
        |> redirect(to: shopping_cart_path(conn, :show, shopping_cart))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", shopping_cart: shopping_cart, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    shopping_cart = Accounts.get_shopping_cart!(id)
    {:ok, _shopping_cart} = Accounts.delete_shopping_cart(shopping_cart)

    conn
    |> put_flash(:info, "Shopping cart deleted successfully.")
    |> redirect(to: shopping_cart_path(conn, :index))
  end
end
