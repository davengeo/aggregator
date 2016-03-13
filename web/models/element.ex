defmodule Aggregator.Element do
  use Aggregator.Web, :model

  schema "elements" do
    field :name, :string
    field :endpoint, :string
    field :method, :string
    field :payload, :string

    timestamps
  end

  @required_fields ~w(name endpoint method payload)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
