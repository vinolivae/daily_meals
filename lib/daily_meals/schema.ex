defmodule DailyMeals.Schema do
  @moduledoc """
  It should be used in order to inject common schema atributes and modules.
  """

  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema

      import Ecto.Changeset

      @primary_key {:id, :binary_id, autogenerate: true}
    end
  end
end
