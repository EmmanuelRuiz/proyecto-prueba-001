defmodule Prueba001Web.DefaultController do
  use Prueba001Web, :controller

  def index(conn, _params) do
    text conn, "Entorno: #{Mix.env()}"
  end

end
