defmodule DailyMealsWeb.MealsView do
  use DailyMealsWeb, :view

  def render("create.json", %{meal: meal}) do
    %{
      message: "Meal created",
      meal: %{
        id: meal.id,
        description: meal.description,
        calories: meal.calories
      }
    }
  end

  def render("show.json", %{meal: meal}) do
    %{
      id: meal.id,
      description: meal.description,
      calories: meal.calories
    }
  end

  def render("show_all.json", %{meals: []}) do
    %{data: []}
  end

  def render("show_all.json", %{meals: meals}) do
    %{data: render_many(meals, __MODULE__, "show.json", as: :meal)}
  end
end
