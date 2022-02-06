defmodule DailyMeals.Factory do
  use ExMachina.Ecto, repo: DailyMeals.Repo

  alias DailyMeals.{Meal, User}

  def meal_factory do
    %Meal{
      description: "um pratão de nada",
      calories: 3
    }
  end

  def user_factory do
    %User{
      name: "zé",
      email: "ze@email",
      cpf: "12345678901"
    }
  end
end
