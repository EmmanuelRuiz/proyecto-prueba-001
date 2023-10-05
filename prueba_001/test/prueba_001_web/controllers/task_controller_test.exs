defmodule Prueba001Web.TaskControllerTest do
  use Prueba001Web.ConnCase

  import Prueba001.TasksFixtures

  alias Prueba001.Tasks.Task

  @create_attrs %{
    name: "some name",
    description: "some description",
    started_at: ~D[2023-10-04],
    end_at: ~D[2023-10-04],
    is_priority: true
  }
  @update_attrs %{
    name: "some updated name",
    description: "some updated description",
    started_at: ~D[2023-10-05],
    end_at: ~D[2023-10-05],
    is_priority: false
  }
  @invalid_attrs %{name: nil, description: nil, started_at: nil, end_at: nil, is_priority: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tasks", %{conn: conn} do
      conn = get(conn, ~p"/api/tasks")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create task" do
    test "renders task when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/tasks", task: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/tasks/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description",
               "end_at" => "2023-10-04",
               "is_priority" => true,
               "name" => "some name",
               "started_at" => "2023-10-04"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/tasks", task: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update task" do
    setup [:create_task]

    test "renders task when data is valid", %{conn: conn, task: %Task{id: id} = task} do
      conn = put(conn, ~p"/api/tasks/#{task}", task: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/tasks/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "end_at" => "2023-10-05",
               "is_priority" => false,
               "name" => "some updated name",
               "started_at" => "2023-10-05"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, task: task} do
      conn = put(conn, ~p"/api/tasks/#{task}", task: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete task" do
    setup [:create_task]

    test "deletes chosen task", %{conn: conn, task: task} do
      conn = delete(conn, ~p"/api/tasks/#{task}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/tasks/#{task}")
      end
    end
  end

  defp create_task(_) do
    task = task_fixture()
    %{task: task}
  end
end
