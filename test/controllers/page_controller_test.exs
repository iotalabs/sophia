defmodule Sophia.PageControllerTest do
  use Sophia.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Sophia"
  end
end
