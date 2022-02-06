defmodule DailyMeals.Users.DeleteTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.{Error, User}
  alias DailyMeals.Users.Delete

  describe "delete/1" do
    test "succeeds if user exists" do
      %{id: id} = insert(:user)

      assert {:ok,
              %User{
                name: "zé",
                email: "ze@email",
                cpf: "12345678901",
                id: ^id,
                inserted_at: %NaiveDateTime{},
                updated_at: %NaiveDateTime{}
              }} = Delete.delete(id)
    end

    test "fails if user doesn't exists" do
      assert {:error, %Error{result: "User not found", status: :not_found}} =
               Delete.delete(Ecto.UUID.generate())
    end
  end
end
