defmodule Sophia.V1.AnnotateControllerTest do
  use Sophia.ConnCase

  alias Sophia.V1.Annotate
  @valid_attrs %{position: "some content", text: "some content", url: "some content", user_id: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, v1_annotate_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    annotate = Repo.insert! %Annotate{}
    conn = get conn, v1_annotate_path(conn, :show, annotate)
    assert json_response(conn, 200)["data"] == %{"id" => annotate.id,
      "user_id" => annotate.user_id,
      "url" => annotate.url,
      "text" => annotate.text,
      "position" => annotate.position}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, v1_annotate_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, v1_annotate_path(conn, :create), annotate: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Annotate, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, v1_annotate_path(conn, :create), annotate: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    annotate = Repo.insert! %Annotate{}
    conn = put conn, v1_annotate_path(conn, :update, annotate), annotate: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Annotate, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    annotate = Repo.insert! %Annotate{}
    conn = put conn, v1_annotate_path(conn, :update, annotate), annotate: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    annotate = Repo.insert! %Annotate{}
    conn = delete conn, v1_annotate_path(conn, :delete, annotate)
    assert response(conn, 204)
    refute Repo.get(Annotate, annotate.id)
  end
end
