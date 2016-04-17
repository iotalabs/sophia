defmodule Sophia.V1.UserView do
  use Sophia.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Sophia.V1.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Sophia.V1.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      password: user.password,
      email: user.email,
      nickname: user.nickname}
  end
end
