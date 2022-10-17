defmodule Todo.Repo.Migrations.AddDueDateToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :due_date, :date, default: Date.to_string(~D[2022-10-17]), null: false # BURR
    end
  end
end
