defmodule DailyMeals.Factory do
  use ExMachina.Ecto, repo: DailyMeals.Repo

  alias DailyMeals.Meal

  def meal_factory do
    %Meal{
      description: "um pratão de nada",
      calories: 3
    }
  end
end
