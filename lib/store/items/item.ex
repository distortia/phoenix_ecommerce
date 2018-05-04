defmodule Store.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset


  schema "items" do
    field :available, :boolean, default: false
    field :description, :string
    field :image, :string
    field :name, :string
    field :price, :decimal
    field :quantity, :integer
    field :sale_price, :decimal

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :description, :image, :price, :available, :quantity, :sale_price])
    |> validate_required([:name, :description, :image, :price, :available, :quantity, :sale_price])
  end
end
