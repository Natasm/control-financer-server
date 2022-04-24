defmodule ControlFinancerServerWeb.RecordView do
  use ControlFinancerServerWeb, :view
  alias ControlFinancerServerWeb.RecordView

  def render("index.json", %{records: records}) do
    %{data: render_many(records, RecordView, "record.json")}
  end

  def render("show.json", %{record: record}) do
    %{data: render_one(record, RecordView, "record.json")}
  end

  def render("record.json", %{record: record}) do
    %{
      id: record.id,
      description: record.description,
      category: render_one(record.category, CategoryView, "category.json"),
      user: render_one(record.user, UserView, "user.json")
    }
  end

  def render("default.json", %{}) do
    %{}
  end
end
