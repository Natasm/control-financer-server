defmodule ControlFinancerServerWeb.RecordCreditCardView do
  use ControlFinancerServerWeb, :view
  alias ControlFinancerServerWeb.RecordCreditCardView

  def render("index.json", %{record_credit_cards: record_credit_cards}) do
    %{data: render_many(record_credit_cards, RecordCreditCardView, "record_credit_card.json")}
  end

  def render("show.json", %{record_credit_card: record_credit_card}) do
    %{data: render_one(record_credit_card, RecordCreditCardView, "record_credit_card.json")}
  end

  def render("record_credit_card.json", %{record_credit_card: record_credit_card}) do
    %{
      id: record_credit_card.id
    }
  end
end
