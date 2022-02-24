defmodule DailyMealsWeb.UsersController do
  use DailyMealsWeb, :controller

  alias DailyMeals
  alias DailyMeals.ChangesetValidation
  alias DailyMeals.Inputs.{CreateUser, UpdateUser}

  alias DailyMealsWeb.FallbackController

  action_fallback FallbackController

  def create_user(conn, params) do
    with {:ok, input} <- ChangesetValidation.cast_and_apply(CreateUser, params),
         {:ok, user} <- DailyMeals.create_user(input) do
      conn
      |> put_status(:created)
      |> render("create.json", %{user: user})
    end
  end

  def delete_user(conn, %{"id" => id}) do
    case DailyMeals.delete_user(id) do
      {:ok, _result} -> send_resp(conn, :no_content, "")
      {:error, _error} = error -> error
    end
  end

  def show_user(conn, %{"id" => id}) do
    case DailyMeals.get_user_by_id(id) do
      {:ok, user} -> conn |> put_status(:ok) |> render("show.json", %{user: user})
      {:error, _error} = error -> error
    end
  end

  def list_all_users(conn, _params) do
    case DailyMeals.get_all_users() do
      [_ | _] = users ->
        conn
        |> put_status(:ok)
        |> render("show_all.json", %{users: users})

      [] ->
        conn
        |> render("show_all.json", %{users: []})
    end
  end

  def update_user(conn, params) do
    with {:ok, input} <- ChangesetValidation.cast_and_apply(UpdateUser, params),
         {:ok, user} <- DailyMeals.update_user(input) do
      conn
      |> put_status(:ok)
      |> render("create.json", %{user: user})
    end
  end
end
