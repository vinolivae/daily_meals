defmodule DailyMeals.Meal do
  use DailyMeals.Schema

  alias DailyMeals.User

  @inputed_params ~w(description calories)a

  schema "meals" do
    field :description, :string
    field :calories, :integer

    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @inputed_params)
    |> validate_length(:description, min: 3, max: 300)
  end
end
