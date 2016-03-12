ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Aggregator.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Aggregator.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Aggregator.Repo)

