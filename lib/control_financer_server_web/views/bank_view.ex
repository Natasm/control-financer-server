defmodule ControlFinancerServerWeb.BankView do
  use ControlFinancerServerWeb, :view
  alias ControlFinancerServerWeb.BankView

  def render("index.json", %{banks: banks}) do
    %{data: render_many(banks, BankView, "bank.json")}
  end

  def render("show.json", %{bank: bank}) do
    %{data: render_one(bank, BankView, "bank.json")}
  end

  def render("bank.json", %{bank: bank}) do
    %{
      id: bank.id
    }
  end
end
