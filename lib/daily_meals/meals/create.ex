defmodule DailyMeals.Meals.Create do
  @moduledoc """
  This module contains the Create Meal action.
  """
  alias DailyMeals.{Error, Meal, Repo}

  @doc """
  Creates a new meal.
  """
  @spec insert(params :: map()) :: {:ok, Meal.t()}
  def insert(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result
  defp handle_insert({:error, result}), do: Error.build(:bad_request, result)
end
