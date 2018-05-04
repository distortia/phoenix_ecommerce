defmodule Store.Accounts.Order do
  use Ecto.Schema
  import Ecto.Changeset


  schema "orders" do
    field :is_cancelled, :boolean

    has_many :items, Store.Items.Item
    belongs_to :user, Store.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [])
    |> validate_required([])
  end
end
