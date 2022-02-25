defmodule DailyMealsWeb.UsersView do
  use DailyMealsWeb, :view

  alias DailyMealsWeb.MealsView

  def render("create.json", %{user: user}) do
    %{
      message: "User Created",
      user: %{
        id: user.id,
        name: user.name,
        cpf: user.cpf,
        email: user.email
      }
    }
  end

  def render("show.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      cpf: user.cpf,
      email: user.email,
      meals: render_many(user.meals, MealsView, "show.json", as: :meal)
    }
  end

  def render("show_all.json", %{users: []}) do
    %{data: []}
  end

  def render("show_all.json", %{users: users}) do
    %{data: render_many(users, __MODULE__, "show.json", as: :user)}
  end
end
