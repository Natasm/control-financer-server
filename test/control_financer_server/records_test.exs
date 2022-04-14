defmodule ControlFinancerServer.RecordsTest do
  use ControlFinancerServer.DataCase

  alias ControlFinancerServer.Records

  describe "records" do
    alias ControlFinancerServer.Records.Record

    import ControlFinancerServer.RecordsFixtures

    @invalid_attrs %{}

    test "list_records/0 returns all records" do
      record = record_fixture()
      assert Records.list_records() == [record]
    end

    test "get_record!/1 returns the record with given id" do
      record = record_fixture()
      assert Records.get_record!(record.id) == record
    end

    test "create_record/1 with valid data creates a record" do
      valid_attrs = %{}

      assert {:ok, %Record{} = record} = Records.create_record(valid_attrs)
    end

    test "create_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_record(@invalid_attrs)
    end

    test "update_record/2 with valid data updates the record" do
      record = record_fixture()
      update_attrs = %{}

      assert {:ok, %Record{} = record} = Records.update_record(record, update_attrs)
    end

    test "update_record/2 with invalid data returns error changeset" do
      record = record_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_record(record, @invalid_attrs)
      assert record == Records.get_record!(record.id)
    end

    test "delete_record/1 deletes the record" do
      record = record_fixture()
      assert {:ok, %Record{}} = Records.delete_record(record)
      assert_raise Ecto.NoResultsError, fn -> Records.get_record!(record.id) end
    end

    test "change_record/1 returns a record changeset" do
      record = record_fixture()
      assert %Ecto.Changeset{} = Records.change_record(record)
    end
  end

  describe "record_account_banks" do
    alias ControlFinancerServer.Records.RecordAccountBank

    import ControlFinancerServer.RecordsFixtures

    @invalid_attrs %{}

    test "list_record_account_banks/0 returns all record_account_banks" do
      record_account_bank = record_account_bank_fixture()
      assert Records.list_record_account_banks() == [record_account_bank]
    end

    test "get_record_account_bank!/1 returns the record_account_bank with given id" do
      record_account_bank = record_account_bank_fixture()
      assert Records.get_record_account_bank!(record_account_bank.id) == record_account_bank
    end

    test "create_record_account_bank/1 with valid data creates a record_account_bank" do
      valid_attrs = %{}

      assert {:ok, %RecordAccountBank{} = record_account_bank} = Records.create_record_account_bank(valid_attrs)
    end

    test "create_record_account_bank/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_record_account_bank(@invalid_attrs)
    end

    test "update_record_account_bank/2 with valid data updates the record_account_bank" do
      record_account_bank = record_account_bank_fixture()
      update_attrs = %{}

      assert {:ok, %RecordAccountBank{} = record_account_bank} = Records.update_record_account_bank(record_account_bank, update_attrs)
    end

    test "update_record_account_bank/2 with invalid data returns error changeset" do
      record_account_bank = record_account_bank_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_record_account_bank(record_account_bank, @invalid_attrs)
      assert record_account_bank == Records.get_record_account_bank!(record_account_bank.id)
    end

    test "delete_record_account_bank/1 deletes the record_account_bank" do
      record_account_bank = record_account_bank_fixture()
      assert {:ok, %RecordAccountBank{}} = Records.delete_record_account_bank(record_account_bank)
      assert_raise Ecto.NoResultsError, fn -> Records.get_record_account_bank!(record_account_bank.id) end
    end

    test "change_record_account_bank/1 returns a record_account_bank changeset" do
      record_account_bank = record_account_bank_fixture()
      assert %Ecto.Changeset{} = Records.change_record_account_bank(record_account_bank)
    end
  end

  describe "record_credit_cards" do
    alias ControlFinancerServer.Records.RecordCreditCard

    import ControlFinancerServer.RecordsFixtures

    @invalid_attrs %{}

    test "list_record_credit_cards/0 returns all record_credit_cards" do
      record_credit_card = record_credit_card_fixture()
      assert Records.list_record_credit_cards() == [record_credit_card]
    end

    test "get_record_credit_card!/1 returns the record_credit_card with given id" do
      record_credit_card = record_credit_card_fixture()
      assert Records.get_record_credit_card!(record_credit_card.id) == record_credit_card
    end

    test "create_record_credit_card/1 with valid data creates a record_credit_card" do
      valid_attrs = %{}

      assert {:ok, %RecordCreditCard{} = record_credit_card} = Records.create_record_credit_card(valid_attrs)
    end

    test "create_record_credit_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_record_credit_card(@invalid_attrs)
    end

    test "update_record_credit_card/2 with valid data updates the record_credit_card" do
      record_credit_card = record_credit_card_fixture()
      update_attrs = %{}

      assert {:ok, %RecordCreditCard{} = record_credit_card} = Records.update_record_credit_card(record_credit_card, update_attrs)
    end

    test "update_record_credit_card/2 with invalid data returns error changeset" do
      record_credit_card = record_credit_card_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_record_credit_card(record_credit_card, @invalid_attrs)
      assert record_credit_card == Records.get_record_credit_card!(record_credit_card.id)
    end

    test "delete_record_credit_card/1 deletes the record_credit_card" do
      record_credit_card = record_credit_card_fixture()
      assert {:ok, %RecordCreditCard{}} = Records.delete_record_credit_card(record_credit_card)
      assert_raise Ecto.NoResultsError, fn -> Records.get_record_credit_card!(record_credit_card.id) end
    end

    test "change_record_credit_card/1 returns a record_credit_card changeset" do
      record_credit_card = record_credit_card_fixture()
      assert %Ecto.Changeset{} = Records.change_record_credit_card(record_credit_card)
    end
  end
end
