defmodule DailyMeals.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :cpf, :string
      add :email, :string

      timestamps()
    end
  end
end
