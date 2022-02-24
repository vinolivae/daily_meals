defmodule DailyMeals.Inputs.UpdateUser do
  @moduledoc """
  This module is used to update a user.
  """

  use DailyMeals.ValueObjectSchema

  @required ~w(id)a
  @optional ~w(name cpf email)a

  embedded_schema do
    field :id, Ecto.UUID
    field :name, :string
    field :cpf, :string
    field :email, :string
  end

  @doc false
  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required ++ @optional)
    |> validate_required(@required)
    |> validate_length(:cpf, min: 11, max: 11)
  end
end
