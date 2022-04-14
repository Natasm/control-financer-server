defmodule ControlFinancerServer.BanksTest do
  use ControlFinancerServer.DataCase

  alias ControlFinancerServer.Banks

  describe "banks" do
    alias ControlFinancerServer.Banks.Bank

    import ControlFinancerServer.BanksFixtures

    @invalid_attrs %{}

    test "list_banks/0 returns all banks" do
      bank = bank_fixture()
      assert Banks.list_banks() == [bank]
    end

    test "get_bank!/1 returns the bank with given id" do
      bank = bank_fixture()
      assert Banks.get_bank!(bank.id) == bank
    end

    test "create_bank/1 with valid data creates a bank" do
      valid_attrs = %{}

      assert {:ok, %Bank{} = bank} = Banks.create_bank(valid_attrs)
    end

    test "create_bank/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Banks.create_bank(@invalid_attrs)
    end

    test "update_bank/2 with valid data updates the bank" do
      bank = bank_fixture()
      update_attrs = %{}

      assert {:ok, %Bank{} = bank} = Banks.update_bank(bank, update_attrs)
    end

    test "update_bank/2 with invalid data returns error changeset" do
      bank = bank_fixture()
      assert {:error, %Ecto.Changeset{}} = Banks.update_bank(bank, @invalid_attrs)
      assert bank == Banks.get_bank!(bank.id)
    end

    test "delete_bank/1 deletes the bank" do
      bank = bank_fixture()
      assert {:ok, %Bank{}} = Banks.delete_bank(bank)
      assert_raise Ecto.NoResultsError, fn -> Banks.get_bank!(bank.id) end
    end

    test "change_bank/1 returns a bank changeset" do
      bank = bank_fixture()
      assert %Ecto.Changeset{} = Banks.change_bank(bank)
    end
  end

  describe "account_banks" do
    alias ControlFinancerServer.Banks.AccountBank

    import ControlFinancerServer.BanksFixtures

    @invalid_attrs %{}

    test "list_account_banks/0 returns all account_banks" do
      account_bank = account_bank_fixture()
      assert Banks.list_account_banks() == [account_bank]
    end

    test "get_account_bank!/1 returns the account_bank with given id" do
      account_bank = account_bank_fixture()
      assert Banks.get_account_bank!(account_bank.id) == account_bank
    end

    test "create_account_bank/1 with valid data creates a account_bank" do
      valid_attrs = %{}

      assert {:ok, %AccountBank{} = account_bank} = Banks.create_account_bank(valid_attrs)
    end

    test "create_account_bank/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Banks.create_account_bank(@invalid_attrs)
    end

    test "update_account_bank/2 with valid data updates the account_bank" do
      account_bank = account_bank_fixture()
      update_attrs = %{}

      assert {:ok, %AccountBank{} = account_bank} = Banks.update_account_bank(account_bank, update_attrs)
    end

    test "update_account_bank/2 with invalid data returns error changeset" do
      account_bank = account_bank_fixture()
      assert {:error, %Ecto.Changeset{}} = Banks.update_account_bank(account_bank, @invalid_attrs)
      assert account_bank == Banks.get_account_bank!(account_bank.id)
    end

    test "delete_account_bank/1 deletes the account_bank" do
      account_bank = account_bank_fixture()
      assert {:ok, %AccountBank{}} = Banks.delete_account_bank(account_bank)
      assert_raise Ecto.NoResultsError, fn -> Banks.get_account_bank!(account_bank.id) end
    end

    test "change_account_bank/1 returns a account_bank changeset" do
      account_bank = account_bank_fixture()
      assert %Ecto.Changeset{} = Banks.change_account_bank(account_bank)
    end
  end

  describe "credit_cards" do
    alias ControlFinancerServer.Banks.CreditCard

    import ControlFinancerServer.BanksFixtures

    @invalid_attrs %{}

    test "list_credit_cards/0 returns all credit_cards" do
      credit_card = credit_card_fixture()
      assert Banks.list_credit_cards() == [credit_card]
    end

    test "get_credit_card!/1 returns the credit_card with given id" do
      credit_card = credit_card_fixture()
      assert Banks.get_credit_card!(credit_card.id) == credit_card
    end

    test "create_credit_card/1 with valid data creates a credit_card" do
      valid_attrs = %{}

      assert {:ok, %CreditCard{} = credit_card} = Banks.create_credit_card(valid_attrs)
    end

    test "create_credit_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Banks.create_credit_card(@invalid_attrs)
    end

    test "update_credit_card/2 with valid data updates the credit_card" do
      credit_card = credit_card_fixture()
      update_attrs = %{}

      assert {:ok, %CreditCard{} = credit_card} = Banks.update_credit_card(credit_card, update_attrs)
    end

    test "update_credit_card/2 with invalid data returns error changeset" do
      credit_card = credit_card_fixture()
      assert {:error, %Ecto.Changeset{}} = Banks.update_credit_card(credit_card, @invalid_attrs)
      assert credit_card == Banks.get_credit_card!(credit_card.id)
    end

    test "delete_credit_card/1 deletes the credit_card" do
      credit_card = credit_card_fixture()
      assert {:ok, %CreditCard{}} = Banks.delete_credit_card(credit_card)
      assert_raise Ecto.NoResultsError, fn -> Banks.get_credit_card!(credit_card.id) end
    end

    test "change_credit_card/1 returns a credit_card changeset" do
      credit_card = credit_card_fixture()
      assert %Ecto.Changeset{} = Banks.change_credit_card(credit_card)
    end
  end
end
