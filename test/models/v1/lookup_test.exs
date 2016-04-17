defmodule Sophia.V1.LookupTest do
  use Sophia.ModelCase

  alias Sophia.V1.Lookup

  @valid_attrs %{position: "some content", relationship: "some content", source: "some content", url: "some content", user_id: "some content", word: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Lookup.changeset(%Lookup{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Lookup.changeset(%Lookup{}, @invalid_attrs)
    refute changeset.valid?
  end
end
