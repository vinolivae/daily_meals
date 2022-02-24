defmodule DailyMeals.Inputs.CreateUser do
  @moduledoc """
  This module is used to create a new user.
  """
  use DailyMeals.ValueObjectSchema

  @required ~w(name cpf email)a

  embedded_schema do
    field :name, :string
    field :cpf, :string
    field :email, :string
  end

  @doc false
  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_length(:cpf, min: 11, max: 11)
  end
end
