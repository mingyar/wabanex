defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Rafael", email: "rafael@banana.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "rafael@banana.com", name: "Rafael", password: "123456"},
               errors: []
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{name: "R", email: "rafael@banana.com"}

      response = User.changeset(params)

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        password: ["can't be blank"]
      }
      assert errors_on(response) == expected_response
    end
  end
end
#THERES MORE CHANGES HERE: https://github.com/rocketseat-education/nlw-06-elixir/commit/0728ca485b06969e6a4607b1d20de9fd7f475acc
