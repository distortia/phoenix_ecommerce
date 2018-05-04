defmodule Store.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :username, :string

    has_one :shopping_cart, Store.Accounts.ShoppingCart
    has_many :orders, Store.Accounts.Order

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
  end
end
