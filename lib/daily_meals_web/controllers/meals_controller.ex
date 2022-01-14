defmodule DailyMealsWeb.MealsController do
  use DailyMealsWeb, :controller

  alias DailyMeals
  alias DailyMeals.ChangesetValidation
  alias DailyMeals.Inputs.{CreateMeal, UpdateMeal}

  alias DailyMealsWeb.FallbackController

  action_fallback FallbackController

  def create_meal(conn, params) do
    with {:ok, input} <- ChangesetValidation.cast_and_apply(CreateMeal, params),
         {:ok, meal} <- DailyMeals.create(input) do
      conn
      |> put_status(:created)
      |> render("create.json", %{meal: meal})
    end
  end

  def delete_meal(conn, %{"id" => id}) do
    case DailyMeals.delete(id) do
      {:ok, _result} -> send_resp(conn, :no_content, "")
      {:error, _error} = error -> error
    end
  end

  def show_meal(conn, %{"id" => id}) do
    case DailyMeals.get_by_id(id) do
      {:ok, meal} -> conn |> put_status(:ok) |> render("show.json", %{meal: meal})
      {:error, _error} = error -> error
    end
  end

  def list_all_meals(conn, _params) do
    case DailyMeals.get_all() do
      [_ | _] = meals ->
        conn
        |> put_status(:ok)
        |> render("show_all.json", %{meals: meals})

      [] ->
        conn
        |> render("show_all.json", %{meals: []})
    end
  end

  def update_meal(conn, params) do
    with {:ok, input} <- ChangesetValidation.cast_and_apply(UpdateMeal, params),
         {:ok, meal} <- DailyMeals.update(input) do
      conn
      |> put_status(:ok)
      |> render("create.json", %{meal: meal})
    end
  end
end
