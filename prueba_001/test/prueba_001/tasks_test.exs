defmodule Prueba001.TasksTest do
  use Prueba001.DataCase

  alias Prueba001.Tasks

  describe "tasks" do
    alias Prueba001.Tasks.Task

    import Prueba001.TasksFixtures

    @invalid_attrs %{name: nil, description: nil, started_at: nil, end_at: nil, is_priority: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{name: "some name", description: "some description", started_at: ~D[2023-10-04], end_at: ~D[2023-10-04], is_priority: true}

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.name == "some name"
      assert task.description == "some description"
      assert task.started_at == ~D[2023-10-04]
      assert task.end_at == ~D[2023-10-04]
      assert task.is_priority == true
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", started_at: ~D[2023-10-05], end_at: ~D[2023-10-05], is_priority: false}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.name == "some updated name"
      assert task.description == "some updated description"
      assert task.started_at == ~D[2023-10-05]
      assert task.end_at == ~D[2023-10-05]
      assert task.is_priority == false
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
