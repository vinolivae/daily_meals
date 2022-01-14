defmodule DailyMealsWeb.FallbackController do
  use DailyMealsWeb, :controller

  alias DailyMeals.Error
  alias DailyMealsWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end

  def call(conn, {:error, error}) do
    conn
    |> put_status(500)
    |> put_view(ErrorView)
    |> render("error.json", result: error)
  end
end
