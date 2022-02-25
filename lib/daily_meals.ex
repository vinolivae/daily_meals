defmodule DailyMeals do
  @moduledoc """
  DailyMeals keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias DailyMeals.Meals.{Create, Delete, Get, Update}
  alias DailyMeals.Users.Create, as: CreateUser
  alias DailyMeals.Users.Delete, as: DeleteUser
  alias DailyMeals.Users.Get, as: GetUser
  alias DailyMeals.Users.Update, as: UpdateUser

  # meal delegates
  defdelegate create(params), to: Create, as: :insert
  defdelegate delete(uuid), to: Delete
  defdelegate get_by_id(uuid), to: Get
  defdelegate get_all, to: Get
  defdelegate update(params), to: Update

  # user delegates
  defdelegate create_user(params), to: CreateUser, as: :insert
  defdelegate delete_user(params), to: DeleteUser, as: :delete
  defdelegate update_user(params), to: UpdateUser, as: :update
  defdelegate get_user_by_id(uuid), to: GetUser, as: :get_by_id
  defdelegate get_all_users, to: GetUser, as: :get_all
end
