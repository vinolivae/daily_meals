defmodule DailyMeals.Meal do
  use DailyMeals.Schema

  @required [:description, :calories]

  schema "meals" do
    field :description, :string
    field :calories, :integer

    timestamps()
  end

  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_length(:description, min: 3, max: 300)
  end
end
