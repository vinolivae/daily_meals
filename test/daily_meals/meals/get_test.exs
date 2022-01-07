defmodule DailyMeals.Meals.GetTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.Error
  alias DailyMeals.Meals.Get

  describe "get_all/0" do
    test "succeeds if meal exists" do
      insert_list(5, :meal)

      assert [
               %DailyMeals.Meal{
                 calories: 3,
                 id: _,
                 description: "um pratão de nada",
                 inserted_at: %NaiveDateTime{},
                 updated_at: %NaiveDateTime{}
               }
               | _
             ] = Get.get_all()
    end

    test "dont return anything if meal doesn't exists" do
      assert [] = Get.get_all()
    end
  end

  describe "get_by_id/1" do
    test "succeeds if meal exists" do
      %{id: id} = insert(:meal)

      assert {:ok,
              %DailyMeals.Meal{
                calories: 3,
                description: "um pratão de nada",
                id: ^id,
                inserted_at: %NaiveDateTime{},
                updated_at: %NaiveDateTime{}
              }} = Get.get_by_id(id)
    end

    test "fails if meal doesn't exists" do
      assert {:error, %Error{result: "Meal not found", status: :not_found}} =
               Get.get_by_id(Ecto.UUID.generate())
    end
  end
end
