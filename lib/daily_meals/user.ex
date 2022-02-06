defmodule DailyMeals.User do
  use DailyMeals.Schema

  alias DailyMeals.Meal

  @inputed_params ~w(name cpf email)a

  schema "users" do
    field :name, :string
    field :cpf, :string
    field :email, :string

    has_many :meals, Meal
    timestamps()
  end

  @doc false
  def changeset(model \\ %__MODULE__{}, params), do: cast(model, params, @inputed_params)
end
