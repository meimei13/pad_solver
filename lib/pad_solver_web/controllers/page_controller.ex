defmodule PadSolverWeb.PageController do
  use PadSolverWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
