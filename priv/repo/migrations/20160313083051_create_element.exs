defmodule Aggregator.Repo.Migrations.CreateElement do
  use Ecto.Migration

  def change do
    create table(:elements) do
      add :name, :string
      add :endpoint, :string
      add :method, :string
      add :payload, :string

      timestamps
    end

  end
end
