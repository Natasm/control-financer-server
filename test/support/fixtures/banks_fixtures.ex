defmodule ControlFinancerServer.BanksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ControlFinancerServer.Banks` context.
  """

  @doc """
  Generate a bank.
  """
  def bank_fixture(attrs \\ %{}) do
    {:ok, bank} =
      attrs
      |> Enum.into(%{

      })
      |> ControlFinancerServer.Banks.create_bank()

    bank
  end

  @doc """
  Generate a account_bank.
  """
  def account_bank_fixture(attrs \\ %{}) do
    {:ok, account_bank} =
      attrs
      |> Enum.into(%{

      })
      |> ControlFinancerServer.Banks.create_account_bank()

    account_bank
  end

  @doc """
  Generate a credit_card.
  """
  def credit_card_fixture(attrs \\ %{}) do
    {:ok, credit_card} =
      attrs
      |> Enum.into(%{

      })
      |> ControlFinancerServer.Banks.create_credit_card()

    credit_card
  end
end
