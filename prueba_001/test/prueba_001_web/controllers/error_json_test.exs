defmodule Prueba001Web.ErrorJSONTest do
  use Prueba001Web.ConnCase, async: true

  test "renders 404" do
    assert Prueba001Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Prueba001Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
