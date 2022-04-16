defmodule ControlFinancerServerWeb.CategoryView do
  use ControlFinancerServerWeb, :view
  alias ControlFinancerServerWeb.CategoryView

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{
      id: category.id,
      name: category.name,
      type: category.type
    }
  end
end
