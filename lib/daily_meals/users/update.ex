defmodule DailyMeals.Users.Update do
  alias DailyMeals.{Error, User, Repo}

  def update(%{id: uuid} = params) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.build_not_found_error("User Not Found")}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
