defmodule DailyMeals.Users.GetTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.{Error, User}
  alias DailyMeals.Users.Get

  describe "get_all/0" do
    test "succeeds if user exists" do
      insert_list(5, :user)

      assert [
               %User{
                 name: "zé",
                 cpf: "12345678901",
                 email: "ze@email",
                 inserted_at: %NaiveDateTime{},
                 updated_at: %NaiveDateTime{}
               }
               | _
             ] = Get.get_all()
    end

    test "dont return anything if user doesn't exists" do
      assert [] = Get.get_all()
    end
  end

  describe "get_by_id/1" do
    test "succeeds if user exists" do
      %{id: id} = insert(:user)

      assert {:ok,
              %User{
                name: "zé",
                cpf: "12345678901",
                email: "ze@email",
                id: ^id,
                inserted_at: %NaiveDateTime{},
                updated_at: %NaiveDateTime{}
              }} = Get.get_by_id(id)
    end

    test "fails if user doesn't exists" do
      assert {:error, %Error{result: "User Not Found", status: :not_found}} =
               Get.get_by_id(Ecto.UUID.generate())
    end
  end
end
