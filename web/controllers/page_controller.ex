defmodule Sophia.PageController do
  use Sophia.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
