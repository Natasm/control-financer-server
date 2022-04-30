defmodule ControlFinancerServerWeb.CategoryController do
  use ControlFinancerServerWeb, :controller

  alias ControlFinancerServer.Utils
  alias ControlFinancerServer.Utils.Category

  action_fallback ControlFinancerServerWeb.FallbackController

  def index(conn, %{"user_id" => user_id}) do
    categories = Utils.list_categories_by_user(user_id)
    render(conn, "index.json", categories: categories)
  end

  def index(conn, _params) do
    categories = Utils.list_categories()
    render(conn, "index.json", categories: categories)
  end

  require Logger

  def get_amount_of_categories_by_user(conn, %{"user_id" => user_id, "month" => month, "year" => year}) do
    amounts = Utils.list_amount_of_categories_by_user(user_id, month, year)
    render(conn, "index_amount.json", amounts: amounts)
  end

  def create(conn, %{"category" => category_params}) do
    with {:ok, %Category{} = category} <- Utils.create_category(category_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.category_path(conn, :show, category))
      |> render("show.json", category: category)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Utils.get_category!(id)
    render(conn, "show.json", category: category)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Utils.get_category!(id)

    with {:ok, %Category{} = category} <- Utils.update_category(category, category_params) do
      render(conn, "show.json", category: category)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Utils.get_category!(id)

    with {:ok, %Category{}} <- Utils.delete_category(category) do
      send_resp(conn, :no_content, "")
    end
  end
end
