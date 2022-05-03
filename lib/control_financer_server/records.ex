defmodule ControlFinancerServer.Records do
  @moduledoc """
  The Records context.
  """

  import Ecto.Query, warn: false
  alias ControlFinancerServer.Repo

  alias ControlFinancerServer.Records.Record

  @doc """
  Returns the list of records.

  ## Examples

      iex> list_records()
      [%Record{}, ...]

  """
  def list_records do
    Repo.all(Record)
  end

  @doc """
  Gets a single record.

  Raises `Ecto.NoResultsError` if the Record does not exist.

  ## Examples

      iex> get_record!(123)
      %Record{}

      iex> get_record!(456)
      ** (Ecto.NoResultsError)

  """
  def get_record!(id), do: Repo.get!(Record, id)

  @doc """
  Creates a record.

  ## Examples

      iex> create_record(%{field: value})
      {:ok, %Record{}}

      iex> create_record(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_record(attrs \\ %{}) do
    %Record{}
    |> Record.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a record.

  ## Examples

      iex> update_record(record, %{field: new_value})
      {:ok, %Record{}}

      iex> update_record(record, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_record(%Record{} = record, attrs) do
    record
    |> Record.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a record.

  ## Examples

      iex> delete_record(record)
      {:ok, %Record{}}

      iex> delete_record(record)
      {:error, %Ecto.Changeset{}}

  """
  def delete_record(%Record{} = record) do
    Repo.delete(record)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking record changes.

  ## Examples

      iex> change_record(record)
      %Ecto.Changeset{data: %Record{}}

  """
  def change_record(%Record{} = record, attrs \\ %{}) do
    Record.changeset(record, attrs)
  end

  alias ControlFinancerServer.Records.RecordAccountBank

  @doc """
  Returns the list of record_account_banks.

  ## Examples

      iex> list_record_account_banks()
      [%RecordAccountBank{}, ...]

  """
  def list_record_account_banks do
    Repo.all(RecordAccountBank)
    |> Repo.preload([:category, :user, :account_bank, account_bank: [:bank, :user]])
  end

  @doc """
  Gets a single record_account_bank.

  Raises `Ecto.NoResultsError` if the Record account bank does not exist.

  ## Examples

      iex> get_record_account_bank!(123)
      %RecordAccountBank{}

      iex> get_record_account_bank!(456)
      ** (Ecto.NoResultsError)

  """
  def get_record_account_bank!(id), do: 
    Repo.get!(RecordAccountBank, id)
    |> Repo.preload([:category, :user, :account_bank, account_bank: [:bank, :user]])

  @doc """
  Creates a record_account_bank.

  ## Examples

      iex> create_record_account_bank(%{field: value})
      {:ok, %RecordAccountBank{}}

      iex> create_record_account_bank(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_record_account_bank(attrs \\ %{}) do
    %RecordAccountBank{}
    |> RecordAccountBank.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a record_account_bank.

  ## Examples

      iex> update_record_account_bank(record_account_bank, %{field: new_value})
      {:ok, %RecordAccountBank{}}

      iex> update_record_account_bank(record_account_bank, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_record_account_bank(%RecordAccountBank{} = record_account_bank, attrs) do
    record_account_bank
    |> RecordAccountBank.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a record_account_bank.

  ## Examples

      iex> delete_record_account_bank(record_account_bank)
      {:ok, %RecordAccountBank{}}

      iex> delete_record_account_bank(record_account_bank)
      {:error, %Ecto.Changeset{}}

  """
  def delete_record_account_bank(%RecordAccountBank{} = record_account_bank) do
    Repo.delete(record_account_bank)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking record_account_bank changes.

  ## Examples

      iex> change_record_account_bank(record_account_bank)
      %Ecto.Changeset{data: %RecordAccountBank{}}

  """
  def change_record_account_bank(%RecordAccountBank{} = record_account_bank, attrs \\ %{}) do
    RecordAccountBank.changeset(record_account_bank, attrs)
  end

  alias ControlFinancerServer.Records.RecordCreditCard

  @doc """
  Returns the list of record_credit_cards.

  ## Examples

      iex> list_record_credit_cards()
      [%RecordCreditCard{}, ...]

  """
  def list_record_credit_cards do
    Repo.all(RecordCreditCard)
  end

  def list_record_credit_cards_by_date(month, year) do
    {month_parsed, _} = Integer.parse(month, 10)
    {year_parsed, _} = Integer.parse(year, 10)

    query = from record in RecordCreditCard,
      where: 
        fragment("EXTRACT(MONTH FROM ?)", record.payment_date) == ^month_parsed and
        fragment("EXTRACT(YEAR FROM ?)", record.payment_date) == ^year_parsed
    
    Repo.all(query)
  end

  def list_record_credit_cards_by_category(category_id) do
    {category_id_parsed, _} = Integer.parse(category_id, 10)

    query = from record in RecordCreditCard,
      where: record.category_id == ^category_id_parsed
    
    Repo.all(query)
  end

  @doc """
  Gets a single record_credit_card.

  Raises `Ecto.NoResultsError` if the Record credit card does not exist.

  ## Examples

      iex> get_record_credit_card!(123)
      %RecordCreditCard{}

      iex> get_record_credit_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_record_credit_card!(id), do: 
    Repo.get!(RecordCreditCard, id)

  @doc """
  Creates a record_credit_card.

  ## Examples

      iex> create_record_credit_card(%{field: value})
      {:ok, %RecordCreditCard{}}

      iex> create_record_credit_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_record_credit_card(attrs \\ %{}) do
    %RecordCreditCard{}
    |> RecordCreditCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a record_credit_card.

  ## Examples

      iex> update_record_credit_card(record_credit_card, %{field: new_value})
      {:ok, %RecordCreditCard{}}

      iex> update_record_credit_card(record_credit_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_record_credit_card(%RecordCreditCard{} = record_credit_card, attrs) do
    record_credit_card
    |> RecordCreditCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a record_credit_card.

  ## Examples

      iex> delete_record_credit_card(record_credit_card)
      {:ok, %RecordCreditCard{}}

      iex> delete_record_credit_card(record_credit_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_record_credit_card(%RecordCreditCard{} = record_credit_card) do
    Repo.delete(record_credit_card)
  end

  def delete_all_record_credit_cards_by_parcel(parcel_id) do
    Ecto.Multi.new()
    |> Ecto.Multi.delete_all(
      :delete_all_records, from(record in RecordCreditCard, where: record.record_credit_card_parcel_id == ^parcel_id)
    )
    |> Ecto.Multi.delete(:delete_parcel, get_record_credit_card_parcel!(parcel_id))
    |> Repo.transaction()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking record_credit_card changes.

  ## Examples

      iex> change_record_credit_card(record_credit_card)
      %Ecto.Changeset{data: %RecordCreditCard{}}

  """
  def change_record_credit_card(%RecordCreditCard{} = record_credit_card, attrs \\ %{}) do
    RecordCreditCard.changeset(record_credit_card, attrs)
  end

  alias ControlFinancerServer.Records.RecordCreditCardParcel

  def create_record_credit_card_all(parcel \\ %{}, records \\ %{}) do
    parcel = RecordCreditCardParcel.changeset(%RecordCreditCardParcel{}, parcel)

    Ecto.Multi.new()
    |> Ecto.Multi.insert(:parcel, parcel)
    |> Ecto.Multi.run(:record_credit_cards, fn repo, %{parcel: parcel} ->
      data = 
        records
        |> transform_to_maps()
        |> include_parcel_id_to_records(parcel)
        |> Enum.map(fn(row) ->
          row
          |> Map.put(:inserted_at, Timex.now(:local) |> NaiveDateTime.truncate(:second))
          |> Map.put(:updated_at, Timex.now(:local) |> NaiveDateTime.truncate(:second))
        end)
      
      {_, rows} = repo.insert_all(RecordCreditCard, data)

      {:ok, rows}
    end)
    |> Repo.transaction()
    |> case do
      {:ok, _} ->
        {:ok, %{records: records}}
      _ ->
        {:error, "Ocorreu um erro"}
      end
  end

  defp include_parcel_id_to_records(data, parcel) do
    data
    |> Enum.map(fn element -> Map.put(element, :record_credit_card_parcel_id, parcel.id) end)
  end

  defp transform_to_maps(attrs) do
    attrs
    |> Enum.map(fn element -> RecordCreditCard.changeset(%RecordCreditCard{}, element).changes end)
  end

  @doc """
  Returns the list of record_credit_cards_parcel.

  ## Examples

      iex> list_record_credit_cards_parcel()
      [%RecordCreditCardParcel{}, ...]

  """
  def list_record_credit_cards_parcel do
    Repo.all(RecordCreditCardParcel)
  end

  @doc """
  Gets a single record_credit_card_parcel.

  Raises `Ecto.NoResultsError` if the Record credit card parcel does not exist.

  ## Examples

      iex> get_record_credit_card_parcel!(123)
      %RecordCreditCardParcel{}

      iex> get_record_credit_card_parcel!(456)
      ** (Ecto.NoResultsError)

  """
  def get_record_credit_card_parcel!(id), do: Repo.get!(RecordCreditCardParcel, id)

  @doc """
  Creates a record_credit_card_parcel.

  ## Examples

      iex> create_record_credit_card_parcel(%{field: value})
      {:ok, %RecordCreditCardParcel{}}

      iex> create_record_credit_card_parcel(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_record_credit_card_parcel(attrs \\ %{}) do
    %RecordCreditCardParcel{}
    |> RecordCreditCardParcel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a record_credit_card_parcel.

  ## Examples

      iex> update_record_credit_card_parcel(record_credit_card_parcel, %{field: new_value})
      {:ok, %RecordCreditCardParcel{}}

      iex> update_record_credit_card_parcel(record_credit_card_parcel, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_record_credit_card_parcel(%RecordCreditCardParcel{} = record_credit_card_parcel, attrs) do
    record_credit_card_parcel
    |> RecordCreditCardParcel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a record_credit_card_parcel.

  ## Examples

      iex> delete_record_credit_card_parcel(record_credit_card_parcel)
      {:ok, %RecordCreditCardParcel{}}

      iex> delete_record_credit_card_parcel(record_credit_card_parcel)
      {:error, %Ecto.Changeset{}}

  """
  def delete_record_credit_card_parcel(%RecordCreditCardParcel{} = record_credit_card_parcel) do
    Repo.delete(record_credit_card_parcel)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking record_credit_card_parcel changes.

  ## Examples

      iex> change_record_credit_card_parcel(record_credit_card_parcel)
      %Ecto.Changeset{data: %RecordCreditCardParcel{}}

  """
  def change_record_credit_card_parcel(%RecordCreditCardParcel{} = record_credit_card_parcel, attrs \\ %{}) do
    RecordCreditCardParcel.changeset(record_credit_card_parcel, attrs)
  end
end
