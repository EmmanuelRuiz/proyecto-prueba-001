defmodule Prueba001.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tasks" do
    field :name, :string
    field :description, :string
    field :started_at, :date
    field :end_at, :date
    field :is_priority, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :description, :started_at, :end_at, :is_priority])
    |> validate_required([:name, :description, :started_at, :end_at, :is_priority])
  end
end
