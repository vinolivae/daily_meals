defmodule DailyMeals.Inputs.UpdateMeal do
  @moduledoc """
  This module is used to update a meal.
  """

  use DailyMeals.ValueObjectSchema

  @required [:id]
  @optional [:description, :calories]

  embedded_schema do
    field :id, Ecto.UUID
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
