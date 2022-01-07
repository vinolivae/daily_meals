defmodule DailyMeals.Meals.UpdateTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.Error
  alias DailyMeals.Meals.Update

  describe "update/1" do
    test "succeeds if params are valid" do
      %{id: id, calories: calories} = meal = insert(:meal)

      update_meal = %{
        description: "Updated description",
        calories: calories,
        id: id
      }

      assert {:ok, updated_meal} = Update.update(update_meal)

      assert updated_meal != meal
    end

    test "fails if params are invalid" do
      %{id: id} = insert(:meal)

      update_meal = %{
        description: "d",
        calories: 2,
        id: id
      }

      assert {
               :error,
               %Ecto.Changeset{
                 errors: [
                   description:
                     {"should be at least %{count} character(s)",
                      [count: 3, validation: :length, kind: :min, type: :string]}
                 ],
                 validations: [description: {:length, [min: 3, max: 300]}]
               }
             } = Update.update(update_meal)
    end

    test "fails if id doesn't exists" do
      update_meal = %{
        description: "Updated description",
        calories: 300,
        id: Ecto.UUID.generate()
      }

      assert {:error, %Error{result: "Meal not found", status: :not_found}} =
               Update.update(update_meal)
    end
  end
end
