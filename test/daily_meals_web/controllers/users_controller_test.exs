defmodule DailyMealsWeb.UsersControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  setup %{conn: conn} do
    {:ok, conn: conn}
  end

  describe "/api/users/" do
    test "successfully creates a user if parameters are valid", ctx do
      assert %{
               "user" => %{
                 "name" => "vinicius",
                 "cpf" => "12345678910",
                 "email" => "email",
                 "id" => _
               },
               "message" => "User Created"
             } =
               ctx.conn
               |> post("/api/users", %{
                 "name" => "vinicius",
                 "cpf" => "12345678910",
                 "email" => "email"
               })
               |> json_response(201)
    end

    test "fails if parameters are invalid", ctx do
      assert %{
               "message" => %{
                 "cpf" => ["can't be blank"],
                 "email" => ["can't be blank"],
                 "name" => ["can't be blank"]
               }
             } =
               ctx.conn
               |> post("/api/users", %{})
               |> json_response(500)
    end

    test "succeeds if returns a list of users", ctx do
      insert_list(4, :user)

      assert %{
               "data" => [
                 %{
                   "name" => "zé",
                   "email" => "ze@email",
                   "cpf" => "12345678901",
                   "id" => _
                 },
                 %{
                   "name" => "zé",
                   "email" => "ze@email",
                   "cpf" => "12345678901",
                   "id" => _
                 },
                 %{
                   "name" => "zé",
                   "email" => "ze@email",
                   "cpf" => "12345678901",
                   "id" => _
                 },
                 %{
                   "name" => "zé",
                   "email" => "ze@email",
                   "cpf" => "12345678901",
                   "id" => _
                 }
               ]
             } =
               ctx.conn
               |> get("/api/users/")
               |> json_response(200)
    end

    test "returns a empty list if no user are found", ctx do
      assert %{"data" => []} =
               ctx.conn
               |> get("/api/users/")
               |> json_response(200)
    end

    test "successfully updates a user if params are valid", ctx do
      user = insert(:user)

      assert %{
               "user" => %{
                 "name" => "vinicius",
                 "cpf" => "12345678910",
                 "email" => "email",
                 "id" => id
               },
               "message" => "User Created"
             } =
               ctx.conn
               |> put("/api/users/", %{
                 "id" => user.id,
                 "name" => "vinicius",
                 "cpf" => "12345678910",
                 "email" => "email"
               })
               |> json_response(200)

      assert user.id == id
    end

    test "fails when trying to update a user if it doesnt exists", ctx do
      assert %{"message" => "User Not Found"} =
               ctx.conn
               |> put("/api/users/", %{
                 "id" => Ecto.UUID.generate(),
                 "name" => "vinicius",
                 "cpf" => "12345678910",
                 "email" => "email"
               })
               |> json_response(404)
    end
  end

  describe "api/users/:id" do
    test "succeeds if the user exists", ctx do
      user = insert(:user)

      assert %{
               "name" => "zé",
               "email" => "ze@email",
               "cpf" => "12345678901",
               "id" => _
             } =
               ctx.conn
               |> get("/api/users/#{user.id}")
               |> json_response(200)
    end

    test "fails if the user doesnt exists", ctx do
      assert %{"message" => "User Not Found"} =
               ctx.conn
               |> get("/api/users/#{Ecto.UUID.generate()}")
               |> json_response(404)
    end

    test "succeeds if user is deleted", ctx do
      user = insert(:user)

      assert ctx.conn |> delete("/api/users/#{user.id}") |> response(204)
    end

    test "fails if has no user to delete", ctx do
      assert %{"message" => "User not found"} =
               ctx.conn
               |> delete("/api/users/#{Ecto.UUID.generate()}")
               |> json_response(404)
    end
  end
end
