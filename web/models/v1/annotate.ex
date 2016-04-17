defmodule Sophia.V1.Annotate do
  use Sophia.Web, :model

  schema "annotates" do
    field :user_id, :string
    field :url, :string
    field :text, :string
    field :position, :string

    timestamps
  end

  @required_fields ~w(user_id url text position)
  @optional_fields ~w()

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
