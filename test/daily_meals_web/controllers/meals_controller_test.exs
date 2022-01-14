defmodule DailyMealsWeb.MealsControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  setup %{conn: conn} do
    {:ok, conn: conn}
  end

  describe "/api/meals/" do
    test "successfully creates a meal if parameters are valid", ctx do
      assert %{
               "meal" => %{
                 "calories" => 300,
                 "description" => "almoço",
                 "id" => _
               },
               "message" => "Meal created"
             } =
               ctx.conn
               |> post("/api/meals", %{"description" => "almoço", "calories" => 300})
               |> json_response(201)
    end

    test "fails if parameters are invalid", ctx do
      assert %{"message" => %{"description" => ["should be at least 3 character(s)"]}} =
               ctx.conn
               |> post("/api/meals", %{"description" => "al", "calories" => 300})
               |> json_response(500)
    end

    test "succeeds if returns a list of meals", ctx do
      insert_list(4, :meal)

      assert %{
               "data" => [
                 %{
                   "calories" => 3,
                   "description" => "um pratão de nada",
                   "id" => _
                 },
                 %{
                   "calories" => 3,
                   "description" => "um pratão de nada",
                   "id" => _
                 },
                 %{
                   "calories" => 3,
                   "description" => "um pratão de nada",
                   "id" => _
                 },
                 %{
                   "calories" => 3,
                   "description" => "um pratão de nada",
                   "id" => _
                 }
               ]
             } =
               ctx.conn
               |> get("/api/meals/")
               |> json_response(200)
    end

    test "returns a empty list if no meal are found", ctx do
      assert %{"data" => []} =
               ctx.conn
               |> get("/api/meals/")
               |> json_response(200)
    end

    test "successfully updates a meal if params are valid", ctx do
      meal = insert(:meal)

      assert %{
               "meal" => %{
                 "calories" => 300,
                 "description" => "almoço",
                 "id" => id
               },
               "message" => "Meal created"
             } =
               ctx.conn
               |> put("/api/meals/", %{
                 "id" => meal.id,
                 "description" => "almoço",
                 "calories" => 300
               })
               |> json_response(200)

      assert meal.id == id
    end

    test "fails when trying to update a meal if it doesnt exists", ctx do
      assert %{"message" => "Meal not found"} =
               ctx.conn
               |> put("/api/meals/", %{
                 "id" => Ecto.UUID.generate(),
                 "description" => "almoço",
                 "calories" => 300
               })
               |> json_response(404)
    end
  end

  describe "api/meals/:id" do
    test "succeeds if the meal exists", ctx do
      meal = insert(:meal)

      assert %{
               "calories" => 3,
               "description" => "um pratão de nada",
               "id" => _
             } =
               ctx.conn
               |> get("/api/meals/#{meal.id}")
               |> json_response(200)
    end

    test "fails if the meal doesnt exists", ctx do
      assert %{"message" => "Meal not found"} =
               ctx.conn
               |> get("/api/meals/#{Ecto.UUID.generate()}")
               |> json_response(404)
    end

    test "succeeds if meal is deleted", ctx do
      meal = insert(:meal)

      assert ctx.conn |> delete("/api/meals/#{meal.id}") |> response(204)
    end

    test "fails if has no meal to delete", ctx do
      assert %{"message" => "Meal not found"} =
               ctx.conn
               |> delete("/api/meals/#{Ecto.UUID.generate()}")
               |> json_response(404)
    end
  end
end
