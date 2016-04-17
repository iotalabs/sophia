defmodule Sophia.V1.Lookup do
  use Sophia.Web, :model

  schema "lookups" do
    field :user_id, :string
    field :url, :string
    field :word, :string
    field :position, :string
    field :source, :string
    field :relationship, :string

    timestamps
  end

  @required_fields ~w(user_id word)
  @optional_fields ~w(url position source relationship)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
