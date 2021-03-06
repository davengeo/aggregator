defmodule Aggregator.ElementController do
  use Aggregator.Web, :controller

  alias Aggregator.Element

  plug :scrub_params, "element" when action in [:create, :update]

  def index(conn, _params) do
    elements = Repo.all(Element)
    render(conn, "index.json", elements: elements)
  end

  def create(conn, %{"element" => element_params}) do
    changeset = Element.changeset(%Element{}, element_params)

    case Repo.insert(changeset) do
      {:ok, element} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", element_path(conn, :show, element))
        |> render("show.json", element: element)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Aggregator.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    element = Repo.get!(Element, id)
    render(conn, "show.json", element: element)
  end

  def update(conn, %{"id" => id, "element" => element_params}) do
    element = Repo.get!(Element, id)
    changeset = Element.changeset(element, element_params)

    case Repo.update(changeset) do
      {:ok, element} ->
        render(conn, "show.json", element: element)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Aggregator.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    element = Repo.get!(Element, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(element)

    send_resp(conn, :no_content, "")
  end
end
