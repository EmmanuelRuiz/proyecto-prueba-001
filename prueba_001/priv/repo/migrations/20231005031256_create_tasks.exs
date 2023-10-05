defmodule Prueba001.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :text
      add :started_at, :timestamp, default: fragment("NOW()")
      add :end_at, :timestamp
      add :is_priority, :boolean, default: false, null: false

      timestamps()
    end
  end
end
