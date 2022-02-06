defmodule DailyMeals.Users.UpdateTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.Error
  alias DailyMeals.Users.Update

  describe "update/1" do
    test "succeeds if params are valid" do
      %{id: id} = user = insert(:user)

      assert {:ok, updated_user} = Update.update(%{name: "joão", id: id})

      assert updated_user != user
    end

    test "fails if id doesn't exists" do
      assert {:error, %Error{result: "User Not Found", status: :not_found}} =
               Update.update(%{
                 name: "joão",
                 id: Ecto.UUID.generate()
               })
    end
  end
end
