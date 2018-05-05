defmodule Store.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Store.Repo

  alias Store.Accounts.Order

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """
  def list_orders do
    Repo.all(Order)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id), do: Repo.get!(Order, id)

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{source: %Order{}}

  """
  def change_order(%Order{} = order) do
    Order.changeset(order, %{})
  end

  alias Store.Accounts.ShoppingCart

  @doc """
  Returns the list of shopping_carts.

  ## Examples

      iex> list_shopping_carts()
      [%ShoppingCart{}, ...]

  """
  def list_shopping_carts do
    Repo.all(ShoppingCart)
  end

  @doc """
  Gets a single shopping_cart.

  Raises `Ecto.NoResultsError` if the Shopping cart does not exist.

  ## Examples

      iex> get_shopping_cart!(123)
      %ShoppingCart{}

      iex> get_shopping_cart!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shopping_cart!(id), do: Repo.get!(ShoppingCart, id)

  @doc """
  Creates a shopping_cart.

  ## Examples

      iex> create_shopping_cart(%{field: value})
      {:ok, %ShoppingCart{}}

      iex> create_shopping_cart(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shopping_cart(attrs \\ %{}) do
    %ShoppingCart{}
    |> ShoppingCart.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shopping_cart.

  ## Examples

      iex> update_shopping_cart(shopping_cart, %{field: new_value})
      {:ok, %ShoppingCart{}}

      iex> update_shopping_cart(shopping_cart, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shopping_cart(%ShoppingCart{} = shopping_cart, attrs) do
    shopping_cart
    |> ShoppingCart.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ShoppingCart.

  ## Examples

      iex> delete_shopping_cart(shopping_cart)
      {:ok, %ShoppingCart{}}

      iex> delete_shopping_cart(shopping_cart)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shopping_cart(%ShoppingCart{} = shopping_cart) do
    Repo.delete(shopping_cart)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shopping_cart changes.

  ## Examples

      iex> change_shopping_cart(shopping_cart)
      %Ecto.Changeset{source: %ShoppingCart{}}

  """
  def change_shopping_cart(%ShoppingCart{} = shopping_cart) do
    ShoppingCart.changeset(shopping_cart, %{})
  end

  alias Store.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def add_to_cart(product) do
    :ok
  end
end
