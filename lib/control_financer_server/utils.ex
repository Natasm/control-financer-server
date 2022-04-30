defmodule ControlFinancerServer.Utils do
  @moduledoc """
  The Utils context.
  """

  import Ecto.Query, warn: false
  alias ControlFinancerServer.Repo

  alias ControlFinancerServer.Utils.Category
  alias ControlFinancerServer.Records.RecordCreditCard

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  def list_categories_by_user(user_id) do
    query = from category in Category,
      where: category.user_id == ^user_id
    
    Repo.all(query)
  end

  def list_amount_of_categories_by_user(user_id, month, year) do
    query = from category in Category,
      where: category.user_id == ^user_id
    
    Repo.all(query)
    |> Enum.map(fn category -> %{
      name: category.name,
      predictValue: category.predictValue,
      currentValue: amount_sum_by_category_and_user(category.id, user_id, month, year)
    } end)
  end

  defp amount_sum_by_category_and_user(category_id, user_id, month, year) do
    {month_parsed, _} = Integer.parse(month, 10)
    {year_parsed, _} = Integer.parse(year, 10)
    
    query_record = from record in RecordCreditCard,
        where: record.category_id == ^category_id and record.user_id == ^user_id
        and fragment("EXTRACT(MONTH FROM ?)", record.payment_date) == ^month_parsed and
        fragment("EXTRACT(YEAR FROM ?)", record.payment_date) == ^year_parsed,
        select: coalesce(sum(record.value), 0)

    Repo.one(query_record)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end
end
