defmodule DailyMeals.Meals.Get do
  @moduledoc """
  This module provides a function to get a meal.
  """
  alias DailyMeals.{Meal, Repo}

  @doc """
  This function gets all meal.
  """
  def get_all, do: Repo.all(Meal)

  @doc """
  this function gets a meal by id.
  """
  @spec get_by_id(uuid :: String.t()) :: {:ok, %Meal{}} | {:error, String.t()}
  def get_by_id(uuid) do
    case Repo.get(Meal, uuid) do
      nil -> {:error, "Meal not found"}
      meal -> {:ok, meal}
    end
  end
end
