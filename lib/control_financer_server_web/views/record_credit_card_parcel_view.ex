defmodule ControlFinancerServerWeb.RecordCreditCardParcelView do
  use ControlFinancerServerWeb, :view
  alias ControlFinancerServerWeb.RecordCreditCardParcelView

  def render("index.json", %{record_credit_cards_parcel: record_credit_cards_parcel}) do
    %{data: render_many(record_credit_cards_parcel, RecordCreditCardParcelView, "record_credit_card_parcel.json")}
  end

  def render("show.json", %{record_credit_card_parcel: record_credit_card_parcel}) do
    %{data: render_one(record_credit_card_parcel, RecordCreditCardParcelView, "record_credit_card_parcel.json")}
  end

  def render("record_credit_card_parcel.json", %{record_credit_card_parcel: record_credit_card_parcel}) do
    %{
      id: record_credit_card_parcel.id
    }
  end
end
