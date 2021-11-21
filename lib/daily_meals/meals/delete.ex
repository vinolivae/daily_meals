defmodule DailyMeals.Meals.Delete do
  @moduledoc """
  This module provides the functionality to delete a meal.
  """
  alias DailyMeals.{Error, Meal, Repo}

  @doc """
  Deletes a meal.
  """
  @spec delete(uuid :: String.t()) :: Meal.t()
  def delete(uuid) do
    case Repo.get(Meal, uuid) do
      nil -> {:error, Error.build_not_found_error("Meal not found")}
      meal -> Repo.delete(meal)
    end
  end
end
