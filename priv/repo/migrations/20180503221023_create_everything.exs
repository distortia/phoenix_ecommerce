defmodule Store.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string

      timestamps()
    end

    create table(:items) do
      add :name, :string
      add :description, :text
      add :image, :string
      add :price, :decimal
      add :available, :boolean, default: false, null: false
      add :quantity, :integer
      add :sale_price, :decimal

      timestamps()
    end

    create table(:orders) do
      add :user_id, references(:users, on_delete: :nothing)
      add :is_cancelled, :boolean

      timestamps()
    end

    create table(:shopping_carts) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:orders, [:user_id])
    create index(:shopping_carts, [:user_id])
  end
end
