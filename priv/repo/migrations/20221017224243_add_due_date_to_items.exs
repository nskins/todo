defmodule Todo.Repo.Migrations.AddDueDateToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      # BURR
      add :due_date, :date, default: Date.to_string(~D[2022-10-17]), null: false
    end
  end
end
