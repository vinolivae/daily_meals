defmodule DailyMeals do
  @moduledoc """
  DailyMeals keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias DailyMeals.Meals.{Create, Delete, Get, Update}

  defdelegate create(params), to: Create, as: :insert
  defdelegate delete(uuid), to: Delete
  defdelegate get_by_id(uuid), to: Get
  defdelegate get_all, to: Get
  defdelegate update(params), to: Update
end
