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
      type: category.type,
      predictValue: category.predictValue,
      user_id: category.user_id
    }
  end

  def render("category_minimal.json", %{category: category}) do
    %{
      id: category.id,
      name: category.name
    }
  end

  def render("index_amount.json", %{amounts: amounts}) do
    %{data: render_many(amounts, CategoryView, "amount_by_categories.json", as: :amount)}
  end

  def render("amount_by_categories.json", %{amount: amount}) do
    %{
      name: amount.name,
      predictValue: amount.predictValue,
      currentValue: amount.currentValue
    }
  end
end
