defmodule DailyMeals.ValueObjectSchema do
  @moduledoc """
  Models a value object. It is mostly used as an embedded object.
  """

  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema

      import Ecto.Changeset

      @primary_key false
      @type t() :: %__MODULE__{}
    end
  end
end
