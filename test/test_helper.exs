ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Sophia.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Sophia.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Sophia.Repo)

