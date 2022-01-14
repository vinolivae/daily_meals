defmodule DailyMeals.Meal do
  use DailyMeals.Schema

  @optional [:description, :calories]

  schema "meals" do
    field :description, :string
    field :calories, :integer

    timestamps()
  end

  @doc false
  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @optional)
    |> validate_length(:description, min: 3, max: 300)
  end
end
