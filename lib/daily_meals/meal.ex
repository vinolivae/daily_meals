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
    cast(model, params, @optional)
  end
end
