defmodule Prueba001.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :text
      add :started_at, :date
      add :end_at, :date
      add :is_priority, :boolean, default: false, null: false

      timestamps()
    end
  end
end
