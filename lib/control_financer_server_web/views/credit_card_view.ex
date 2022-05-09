defmodule ControlFinancerServerWeb.CreditCardView do
  use ControlFinancerServerWeb, :view
  alias ControlFinancerServerWeb.CreditCardView

  alias ControlFinancerServerWeb.BankView
  alias ControlFinancerServerWeb.AccountBankView
  alias ControlFinancerServerWeb.UserView

  def render("index.json", %{credit_cards: credit_cards}) do
    %{data: render_many(credit_cards, CreditCardView, "credit_card.json")}
  end

  def render("show.json", %{credit_card: credit_card}) do
    %{data: render_one(credit_card, CreditCardView, "credit_card.json")}
  end

  def render("credit_card.json", %{credit_card: credit_card}) do
    %{
      id: credit_card.id,
      name: credit_card.name,
      limit: credit_card.limit,
      closing_day: credit_card.closing_day,
      expiration_day: credit_card.expiration_day,
      bank: render_one(credit_card.bank, BankView, "bank.json"),
      account_bank: render_one(credit_card.account_bank, AccountBankView, "account_bank.json"),
      user: render_one(credit_card.user, UserView, "user.json")
    }
  end

  def render("credit_card_minimal.json", %{credit_card: credit_card}) do
    %{
      id: credit_card.id,
      name: credit_card.name
    }
  end

  def render("default.json", %{}) do
    %{}
  end
end
