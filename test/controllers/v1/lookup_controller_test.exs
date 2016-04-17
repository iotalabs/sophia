defmodule Sophia.V1.LookupControllerTest do
  use Sophia.ConnCase

  alias Sophia.V1.Lookup
  @valid_attrs %{position: "some content", relationship: "some content", source: "some content", url: "some content", user_id: "some content", word: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, v1_lookup_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    lookup = Repo.insert! %Lookup{}
    conn = get conn, v1_lookup_path(conn, :show, lookup)
    assert json_response(conn, 200)["data"] == %{"id" => lookup.id,
      "user_id" => lookup.user_id,
      "url" => lookup.url,
      "word" => lookup.word,
      "position" => lookup.position,
      "source" => lookup.source,
      "relationship" => lookup.relationship}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, v1_lookup_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, v1_lookup_path(conn, :create), lookup: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Lookup, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, v1_lookup_path(conn, :create), lookup: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    lookup = Repo.insert! %Lookup{}
    conn = put conn, v1_lookup_path(conn, :update, lookup), lookup: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Lookup, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    lookup = Repo.insert! %Lookup{}
    conn = put conn, v1_lookup_path(conn, :update, lookup), lookup: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    lookup = Repo.insert! %Lookup{}
    conn = delete conn, v1_lookup_path(conn, :delete, lookup)
    assert response(conn, 204)
    refute Repo.get(Lookup, lookup.id)
  end
end
