defmodule DailyMeals.Repo.Migrations.AddMealTable do
  use Ecto.Migration

  def change do
    create table(:meals, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :description, :string
      add :calories, :integer

      timestamps()
    end
  end
end
