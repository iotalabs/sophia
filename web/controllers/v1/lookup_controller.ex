defmodule Sophia.V1.LookupController do
  use Sophia.Web, :controller

  alias Sophia.V1.Lookup

  plug :scrub_params, "lookup" when action in [:create, :update]

  def index(conn, _params) do
    lookups = Repo.all(Lookup)
    render(conn, "index.json", lookups: lookups)
  end

  def create(conn, %{"lookup" => lookup_params}) do
    changeset = Lookup.changeset(%Lookup{}, lookup_params)

    case Repo.insert(changeset) do
      {:ok, lookup} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", v1_lookup_path(conn, :show, lookup))
        |> render("show.json", lookup: lookup)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Sophia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lookup = Repo.get!(Lookup, id)
    render(conn, "show.json", lookup: lookup)
  end

  def update(conn, %{"id" => id, "lookup" => lookup_params}) do
    lookup = Repo.get!(Lookup, id)
    changeset = Lookup.changeset(lookup, lookup_params)

    case Repo.update(changeset) do
      {:ok, lookup} ->
        render(conn, "show.json", lookup: lookup)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Sophia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lookup = Repo.get!(Lookup, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(lookup)

    send_resp(conn, :no_content, "")
  end
end
