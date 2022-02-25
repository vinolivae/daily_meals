defmodule DailyMeals.Users.Delete do
  alias DailyMeals.{Error, Repo, User}

  @spec delete(uuid :: String.t()) :: User.t() | Error.t()
  def delete(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.build_not_found_error("User not found")}
      user -> Repo.delete(user)
    end
  end
end
