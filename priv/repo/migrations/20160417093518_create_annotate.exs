defmodule Sophia.Repo.Migrations.CreateAnnotate do
  use Ecto.Migration

  def change do
    create table(:annotates) do
      add :user_id, :string
      add :url, :string
      add :text, :string
      add :position, :string

      timestamps
    end

  end
end
