defmodule Prueba001Web.TaskJSON do
  alias Prueba001.Tasks.Task

  @doc """
  Renders a list of tasks.
  """
  def index(%{tasks: tasks}) do
    %{data: for(task <- tasks, do: data(task))}
  end

  @doc """
  Renders a single task.
  """
  def show(%{task: task}) do
    %{data: data(task)}
  end

  defp data(%Task{} = task) do
    %{
      id: task.id,
      name: task.name,
      description: task.description,
      started_at: task.started_at,
      end_at: task.end_at,
      is_priority: task.is_priority
    }
  end
end
