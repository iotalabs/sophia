defmodule Sophia.V1.AnnotateTest do
  use Sophia.ModelCase

  alias Sophia.V1.Annotate

  @valid_attrs %{position: "some content", text: "some content", url: "some content", user_id: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Annotate.changeset(%Annotate{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Annotate.changeset(%Annotate{}, @invalid_attrs)
    refute changeset.valid?
  end
end
