defmodule DailyMeals.Inputs.UpdateMeal do
  @moduledoc """
  This module is used to update a meal.
  """

  use DailyMeals.Schema

  @optional [:description, :calories]

  embedded_schema do
    field :description, :string
    field :calories, :integer
  end

  @doc false
  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @optional)
    |> validate_length(:description, min: 3, max: 300)
  end
end
