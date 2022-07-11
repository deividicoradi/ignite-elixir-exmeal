defmodule ExmealWeb.FallbackControllerTest do
  use ExmealWeb.ConnCase, async: true

  alias Exmeal.Error
  alias ExmealWeb.FallbackController

  test "call/2 with changeset", %{conn: conn} do
    response =
      FallbackController.call(conn, {:error, %Error{status: :bad_request, result: "blabla"}})

    assert Map.has_key?(json_response(response, 400), "message")
  end
end
