defmodule Sophia.V1.AnnotateController do
  use Sophia.Web, :controller

  alias Sophia.V1.Annotate

  plug :scrub_params, "annotate" when action in [:create, :update]

  def index(conn, _params) do
    annotates = Repo.all(Annotate)
    render(conn, "index.json", annotates: annotates)
  end

  def create(conn, %{"annotate" => annotate_params}) do
    changeset = Annotate.changeset(%Annotate{}, annotate_params)

    case Repo.insert(changeset) do
      {:ok, annotate} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", v1_annotate_path(conn, :show, annotate))
        |> render("show.json", annotate: annotate)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Sophia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    annotate = Repo.get!(Annotate, id)
    render(conn, "show.json", annotate: annotate)
  end

  def update(conn, %{"id" => id, "annotate" => annotate_params}) do
    annotate = Repo.get!(Annotate, id)
    changeset = Annotate.changeset(annotate, annotate_params)

    case Repo.update(changeset) do
      {:ok, annotate} ->
        render(conn, "show.json", annotate: annotate)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Sophia.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    annotate = Repo.get!(Annotate, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(annotate)

    send_resp(conn, :no_content, "")
  end
end
