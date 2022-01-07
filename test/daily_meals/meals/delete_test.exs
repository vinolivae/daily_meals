defmodule DailyMeals.Meals.DeleteTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.Error
  alias DailyMeals.Meals.Delete

  describe "delete/1" do
    test "succeeds if meal exists" do
      %{id: id} = insert(:meal)

      assert {:ok,
              %DailyMeals.Meal{
                calories: 3,
                description: "um pratão de nada",
                id: ^id,
                inserted_at: %NaiveDateTime{},
                updated_at: %NaiveDateTime{}
              }} = Delete.delete(id)
    end

    test "fails if meal doesn't exists" do
      assert {:error, %Error{result: "Meal not found", status: :not_found}} =
               Delete.delete(Ecto.UUID.generate())
    end
  end
end
