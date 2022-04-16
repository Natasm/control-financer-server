defmodule ControlFinancerServer.Banks do
  @moduledoc """
  The Banks context.
  """

  import Ecto.Query, warn: false
  alias ControlFinancerServer.Repo

  alias ControlFinancerServer.Banks.Bank

  @doc """
  Returns the list of banks.

  ## Examples

      iex> list_banks()
      [%Bank{}, ...]

  """
  def list_banks do
    Repo.all(Bank)
  end

  @doc """
  Gets a single bank.

  Raises `Ecto.NoResultsError` if the Bank does not exist.

  ## Examples

      iex> get_bank!(123)
      %Bank{}

      iex> get_bank!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bank!(id), do: Repo.get!(Bank, id)

  @doc """
  Creates a bank.

  ## Examples

      iex> create_bank(%{field: value})
      {:ok, %Bank{}}

      iex> create_bank(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bank(attrs \\ %{}) do
    %Bank{}
    |> Bank.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bank.

  ## Examples

      iex> update_bank(bank, %{field: new_value})
      {:ok, %Bank{}}

      iex> update_bank(bank, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bank(%Bank{} = bank, attrs) do
    bank
    |> Bank.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bank.

  ## Examples

      iex> delete_bank(bank)
      {:ok, %Bank{}}

      iex> delete_bank(bank)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bank(%Bank{} = bank) do
    Repo.delete(bank)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bank changes.

  ## Examples

      iex> change_bank(bank)
      %Ecto.Changeset{data: %Bank{}}

  """
  def change_bank(%Bank{} = bank, attrs \\ %{}) do
    Bank.changeset(bank, attrs)
  end

  alias ControlFinancerServer.Banks.AccountBank

  @doc """
  Returns the list of account_banks.

  ## Examples

      iex> list_account_banks()
      [%AccountBank{}, ...]

  """
  def list_account_banks do
    Repo.all(AccountBank)
    |> Repo.preload([:bank, :user])
  end

  @doc """
  Gets a single account_bank.

  Raises `Ecto.NoResultsError` if the Account bank does not exist.

  ## Examples

      iex> get_account_bank!(123)
      %AccountBank{}

      iex> get_account_bank!(456)
      ** (Ecto.NoResultsError)

  """
  def get_account_bank!(id), do: 
    Repo.get!(AccountBank, id) 
    |> Repo.preload([:bank, :user])

  @doc """
  Creates a account_bank.

  ## Examples

      iex> create_account_bank(%{field: value})
      {:ok, %AccountBank{}}

      iex> create_account_bank(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_account_bank(attrs \\ %{}) do
    %AccountBank{}
    |> AccountBank.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a account_bank.

  ## Examples

      iex> update_account_bank(account_bank, %{field: new_value})
      {:ok, %AccountBank{}}

      iex> update_account_bank(account_bank, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_account_bank(%AccountBank{} = account_bank, attrs) do
    account_bank
    |> AccountBank.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a account_bank.

  ## Examples

      iex> delete_account_bank(account_bank)
      {:ok, %AccountBank{}}

      iex> delete_account_bank(account_bank)
      {:error, %Ecto.Changeset{}}

  """
  def delete_account_bank(%AccountBank{} = account_bank) do
    Repo.delete(account_bank)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account_bank changes.

  ## Examples

      iex> change_account_bank(account_bank)
      %Ecto.Changeset{data: %AccountBank{}}

  """
  def change_account_bank(%AccountBank{} = account_bank, attrs \\ %{}) do
    AccountBank.changeset(account_bank, attrs)
  end

  alias ControlFinancerServer.Banks.CreditCard

  @doc """
  Returns the list of credit_cards.

  ## Examples

      iex> list_credit_cards()
      [%CreditCard{}, ...]

  """
  def list_credit_cards do
    Repo.all(CreditCard)
    |> Repo.preload([:bank, :account_bank, :user, account_bank: [:bank, :user]])
  end

  @doc """
  Gets a single credit_card.

  Raises `Ecto.NoResultsError` if the Credit card does not exist.

  ## Examples

      iex> get_credit_card!(123)
      %CreditCard{}

      iex> get_credit_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_credit_card!(id), do: 
    Repo.get!(CreditCard, id)
    |> Repo.preload([:bank, :account_bank, :user, account_bank: [:bank, :user]])

  @doc """
  Creates a credit_card.

  ## Examples

      iex> create_credit_card(%{field: value})
      {:ok, %CreditCard{}}

      iex> create_credit_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_credit_card(attrs \\ %{}) do
    %CreditCard{}
    |> CreditCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a credit_card.

  ## Examples

      iex> update_credit_card(credit_card, %{field: new_value})
      {:ok, %CreditCard{}}

      iex> update_credit_card(credit_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_credit_card(%CreditCard{} = credit_card, attrs) do
    credit_card
    |> CreditCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a credit_card.

  ## Examples

      iex> delete_credit_card(credit_card)
      {:ok, %CreditCard{}}

      iex> delete_credit_card(credit_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_credit_card(%CreditCard{} = credit_card) do
    Repo.delete(credit_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking credit_card changes.

  ## Examples

      iex> change_credit_card(credit_card)
      %Ecto.Changeset{data: %CreditCard{}}

  """
  def change_credit_card(%CreditCard{} = credit_card, attrs \\ %{}) do
    CreditCard.changeset(credit_card, attrs)
  end
end
