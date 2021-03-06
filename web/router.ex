defmodule BenanachainRegistry.Router do
  use BenanachainRegistry.Web, :router

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

  scope "/", BenanachainRegistry do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", BenanachainRegistry do
    pipe_through :api

    post "/register", PageController, :register

    post "/deregister", PageController, :deregister
    
    get "/nodes", PageController, :nodes
  end
end
