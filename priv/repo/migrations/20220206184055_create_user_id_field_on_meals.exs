defmodule DailyMeals.Repo.Migrations.CreateUserIdFieldOnMeals do
  use Ecto.Migration

  def change do
    alter table(:meals) do
      add :user_id, references(:users, type: :uuid)
    end
  end
end
