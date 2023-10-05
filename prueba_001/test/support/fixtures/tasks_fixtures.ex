defmodule Prueba001.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Prueba001.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{

      })
      |> Prueba001.Tasks.create_task()

    task
  end
end
