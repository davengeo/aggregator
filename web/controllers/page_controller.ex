defmodule Aggregator.PageController do
  use Aggregator.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
