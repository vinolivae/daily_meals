defmodule DailyMeals.Meals.CreateTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.{Error, Meal}
  alias DailyMeals.Meals.Create

  describe "insert/1" do
    test "Creates a meal if params are valid" do
      params = %{description: "Um prato de arroz", calories: 157}

      assert {:ok, %Meal{description: description, calories: calories}} = Create.insert(params)

      assert "Um prato de arroz" = description
      assert 157 = calories
    end

    test "Fails if params are invalid" do
      params = %{description: "Um"}

      assert %Error{
               result: %Ecto.Changeset{
                 changes: %{description: "Um"},
                 errors: [
                   description:
                     {"should be at least %{count} character(s)",
                      [count: 3, validation: :length, kind: :min, type: :string]}
                 ],
                 valid?: false
               },
               status: :bad_request
             } = Create.insert(params)
    end
  end
end
