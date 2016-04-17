defmodule Sophia.Repo.Migrations.CreateLookup do
  use Ecto.Migration

  def change do
    create table(:lookups) do
      add :user_id, :string
      add :url, :string
      add :word, :string
      add :position, :string
      add :source, :string
      add :relationship, :string

      timestamps
    end

  end
end
