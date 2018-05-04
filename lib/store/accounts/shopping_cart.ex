defmodule Store.Accounts.ShoppingCart do
  use Ecto.Schema
  import Ecto.Changeset


  schema "shopping_carts" do
    has_many :items, Store.Items.Item
    belongs_to :user, Store.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(shopping_cart, attrs) do
    shopping_cart
    |> cast(attrs, [])
    |> validate_required([])
  end
end
