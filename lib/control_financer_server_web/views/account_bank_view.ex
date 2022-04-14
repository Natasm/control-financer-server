defmodule ControlFinancerServerWeb.AccountBankView do
  use ControlFinancerServerWeb, :view
  alias ControlFinancerServerWeb.AccountBankView

  def render("index.json", %{account_banks: account_banks}) do
    %{data: render_many(account_banks, AccountBankView, "account_bank.json")}
  end

  def render("show.json", %{account_bank: account_bank}) do
    %{data: render_one(account_bank, AccountBankView, "account_bank.json")}
  end

  def render("account_bank.json", %{account_bank: account_bank}) do
    %{
      id: account_bank.id
    }
  end
end
