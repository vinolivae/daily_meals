defmodule DailyMeals.Users.Get do
  alias DailyMeals.{Error, Repo, User}

  def get_all, do: Repo.all(User) |> Enum.map(&Repo.preload(&1, :meals))

  def get_by_id(uuid) do
    User
    |> Repo.get(uuid)
    |> Repo.preload(:meals)
    |> case do
      nil -> {:error, Error.build_not_found_error("User Not Found")}
      user -> {:ok, user}
    end
  end
end
