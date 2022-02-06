defmodule DailyMeals.Users.CreateTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.User
  alias DailyMeals.Users.Create

  describe "insert/1" do
    test "Creates a user if params are valid" do
      params = %{name: "John Doe", email: "email@email", cpf: "12345678901"}

      assert {:ok,
              %User{
                name: "John Doe",
                email: "email@email",
                cpf: "12345678901"
              }} = Create.insert(params)
    end
  end
end
