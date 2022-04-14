defmodule ControlFinancerServer.RecordsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ControlFinancerServer.Records` context.
  """

  @doc """
  Generate a record.
  """
  def record_fixture(attrs \\ %{}) do
    {:ok, record} =
      attrs
      |> Enum.into(%{

      })
      |> ControlFinancerServer.Records.create_record()

    record
  end

  @doc """
  Generate a record_account_bank.
  """
  def record_account_bank_fixture(attrs \\ %{}) do
    {:ok, record_account_bank} =
      attrs
      |> Enum.into(%{

      })
      |> ControlFinancerServer.Records.create_record_account_bank()

    record_account_bank
  end

  @doc """
  Generate a record_credit_card.
  """
  def record_credit_card_fixture(attrs \\ %{}) do
    {:ok, record_credit_card} =
      attrs
      |> Enum.into(%{

      })
      |> ControlFinancerServer.Records.create_record_credit_card()

    record_credit_card
  end
end
