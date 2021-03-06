defmodule StoreWeb.Router do
  use StoreWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", StoreWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/items", ItemController
    resources "/orders", OrderController
    resources "/shopping_cart", ShoppingCartController
    get "/shopping_cart/add", ShoppingCartController, :add
  end

  # Other scopes may use custom stacks.
  # scope "/api", StoreWeb do
  #   pipe_through :api
  # end
end
