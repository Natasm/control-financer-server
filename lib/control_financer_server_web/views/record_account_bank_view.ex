defmodule ControlFinancerServerWeb.RecordAccountBankView do
  use ControlFinancerServerWeb, :view
  alias ControlFinancerServerWeb.RecordAccountBankView

  def render("index.json", %{record_account_banks: record_account_banks}) do
    %{data: render_many(record_account_banks, RecordAccountBankView, "record_account_bank.json")}
  end

  def render("show.json", %{record_account_bank: record_account_bank}) do
    %{data: render_one(record_account_bank, RecordAccountBankView, "record_account_bank.json")}
  end

  def render("record_account_bank.json", %{record_account_bank: record_account_bank}) do
    %{
      id: record_account_bank.id
    }
  end
end
