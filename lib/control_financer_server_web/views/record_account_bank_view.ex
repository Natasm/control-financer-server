defmodule ControlFinancerServerWeb.RecordAccountBankView do
  use ControlFinancerServerWeb, :view
  alias ControlFinancerServerWeb.RecordAccountBankView

  alias ControlFinancerServerWeb.CategoryView
  alias ControlFinancerServerWeb.UserView
  alias ControlFinancerServerWeb.AccountBankView

  def render("index.json", %{record_account_banks: record_account_banks}) do
    %{data: render_many(record_account_banks, RecordAccountBankView, "record_account_bank.json")}
  end

  def render("show.json", %{record_account_bank: record_account_bank}) do
    %{data: render_one(record_account_bank, RecordAccountBankView, "record_account_bank.json")}
  end

  def render("record_account_bank.json", %{record_account_bank: record_account_bank}) do
    %{
      id: record_account_bank.id,
      description: record_account_bank.description,
      category: render_one(record_account_bank.category, CategoryView, "category.json"),
      user: render_one(record_account_bank.user, UserView, "user.json"),

      account_bank: render_one(record_account_bank.account_bank, AccountBankView, "account_bank.json"),
      value: record_account_bank.value,
      payment_date: record_account_bank.payment_date,
      status: record_account_bank.status
    }
  end

  def render("default.json", %{}) do
    %{}
  end
end
