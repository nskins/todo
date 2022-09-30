defmodule Todo.Repo.Migrations.AddStatusToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :status, :string, default: "todo", null: false
    end
  end
end
