defmodule Aggregator.ElementView do
  use Aggregator.Web, :view

  def render("index.json", %{elements: elements}) do
    %{data: render_many(elements, Aggregator.ElementView, "element.json")}
  end

  def render("show.json", %{element: element}) do
    %{data: render_one(element, Aggregator.ElementView, "element.json")}
  end

  def render("element.json", %{element: element}) do
    %{id: element.id,
      name: element.name,
      endpoint: element.endpoint,
      method: element.method,
      payload: element.payload}
  end
end
