defmodule Todo.Notebook.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string
    field :user_id, :id
    field :status, Ecto.Enum, values: [:todo, :done]

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:description, :user_id, :status])
    |> validate_required([:description, :user_id, :status])
  end
end
