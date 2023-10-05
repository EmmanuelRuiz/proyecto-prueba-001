defmodule Prueba001.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tasks" do


    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [])
    |> validate_required([])
  end
end
