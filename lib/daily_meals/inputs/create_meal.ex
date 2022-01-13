defmodule DailyMeals.Inputs.CreateMeal do
  @moduledoc """
  This module is used to create a new meal.
  """
  use DailyMeals.Schema

  @required [:description]
  @optional [:calories]

  embedded_schema do
    field :description, :string
    field :calories, :integer
  end

  @doc false
  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required ++ @optional)
    |> validate_required(@required)
    |> validate_length(:description, min: 3, max: 300)
  end
end
