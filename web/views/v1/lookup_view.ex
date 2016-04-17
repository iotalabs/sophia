defmodule Sophia.V1.LookupView do
  use Sophia.Web, :view

  def render("index.json", %{lookups: lookups}) do
    %{data: render_many(lookups, Sophia.V1.LookupView, "lookup.json")}
  end

  def render("show.json", %{lookup: lookup}) do
    %{data: render_one(lookup, Sophia.V1.LookupView, "lookup.json")}
  end

  def render("lookup.json", %{lookup: lookup}) do
    %{id: lookup.id,
      user_id: lookup.user_id,
      url: lookup.url,
      word: lookup.word,
      position: lookup.position,
      source: lookup.source,
      relationship: lookup.relationship}
  end
end
