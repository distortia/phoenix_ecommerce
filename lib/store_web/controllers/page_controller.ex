defmodule StoreWeb.PageController do
  use StoreWeb, :controller

  def index(conn, _params) do
    IO.inspect Store.Items.list_items
    render conn, "index.html", items: Store.Items.list_items()
  end
end
