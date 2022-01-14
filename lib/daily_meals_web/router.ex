defmodule DailyMealsWeb.Router do
  use DailyMealsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DailyMealsWeb do
    pipe_through :api

    scope "/meals" do
      post "/", MealsController, :create_meal
      get "/", MealsController, :list_all_meals
      put "/", MealsController, :update_meal
      get "/:id", MealsController, :show_meal
      delete "/:id", MealsController, :delete_meal
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
