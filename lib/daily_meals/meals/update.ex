defmodule DailyMeals.Meals.Update do
  @moduledoc """
  This module contains the update meal command.
  """
  alias DailyMeals.{Error, Meal, Repo}

  @doc """
  Update a meal.
  """
  @spec update(params :: map()) :: Meal.t()
  def update(%{id: uuid} = params) do
    case Repo.get(Meal, uuid) do
      nil -> {:error, Error.build_not_found_error("Meal not found")}
      meal -> update(meal, params)
    end
  end

  defp update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
