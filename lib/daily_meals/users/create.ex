defmodule DailyMeals.Users.Create do
  alias DailyMeals.{Error, Repo, User}

  @doc """
  Creates a new user.
  """
  @spec insert(params :: map()) :: {:ok, User.t()}
  def insert(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result
  defp handle_insert({:error, result}), do: Error.build(:bad_request, result)
end
