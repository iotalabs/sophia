defmodule Sophia.V1.AnnotateView do
  use Sophia.Web, :view

  def render("index.json", %{annotates: annotates}) do
    %{data: render_many(annotates, Sophia.V1.AnnotateView, "annotate.json")}
  end

  def render("show.json", %{annotate: annotate}) do
    %{data: render_one(annotate, Sophia.V1.AnnotateView, "annotate.json")}
  end

  def render("annotate.json", %{annotate: annotate}) do
    %{id: annotate.id,
      user_id: annotate.user_id,
      url: annotate.url,
      text: annotate.text,
      position: annotate.position}
  end
end
