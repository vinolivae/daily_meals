defmodule DailyMeals.Users.Get do
  alias DailyMeals.{Error, User, Repo}

  def get_all, do: Repo.all(User)

  def get_by_id(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, Error.build_not_found_error("User Not Found")}
      user -> {:ok, user}
    end
  end
end
