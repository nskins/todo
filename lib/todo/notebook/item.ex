defmodule Todo.Notebook.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string
    field :user_id, :id
    field :status, Ecto.Enum, values: [:todo, :done]
    field :due_date, :date

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:description, :user_id, :status, :date])
    |> validate_required([:description, :user_id, :status, :date])
  end

  def pretty_status(item) do
    case item.status do
      :todo -> "To Do"
      :done -> "Done"
    end
  end
end
