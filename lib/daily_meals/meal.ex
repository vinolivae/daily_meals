defmodule DailyMeals.Meal do
  use DailyMeals.Schema

  alias DailyMeals.User

  @inputted_params ~w(description calories user_id)a

  schema "meals" do
    field :description, :string
    field :calories, :integer

    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @inputted_params)
    |> validate_length(:description, min: 3, max: 300)
  end
end
