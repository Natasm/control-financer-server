defmodule ControlFinancerServerWeb.RecordCreditCardView do
  use ControlFinancerServerWeb, :view
  alias ControlFinancerServerWeb.RecordCreditCardView

  alias ControlFinancerServerWeb.CategoryView
  alias ControlFinancerServerWeb.UserView
  alias ControlFinancerServerWeb.CreditCardView
  alias ControlFinancerServerWeb.RecordCreditCardParcelView

  def render("index.json", %{record_credit_cards: record_credit_cards}) do
    %{data: render_many(record_credit_cards, RecordCreditCardView, "record_credit_card.json")}
  end

  def render("show.json", %{record_credit_card: record_credit_card}) do
    %{data: render_one(record_credit_card, RecordCreditCardView, "record_credit_card.json")}
  end

  def render("record_credit_card.json", %{record_credit_card: record_credit_card}) do
    %{
      id: record_credit_card.id,
      description: record_credit_card.description,
      
      category: render_one(record_credit_card.category, CategoryView, "category_minimal.json"),
      #category_id: record_credit_card.category_id,
      
      #user: render_one(record_credit_card.user, UserView, "user.json"),
      user_id: record_credit_card.user_id,
      
      credit_card: render_one(record_credit_card.credit_card, CreditCardView, "credit_card_minimal.json"),
      #credit_card_id: record_credit_card.credit_card_id,

      record_credit_card_parcel: render_one(record_credit_card.record_credit_card_parcel, RecordCreditCardParcelView, "record_credit_card_parcel.json"),
      
      value: record_credit_card.value,
      payment_date: record_credit_card.payment_date,
      status: record_credit_card.status,
      equivalent_parcel_number: record_credit_card.equivalent_parcel_number,

      inserted_at: record_credit_card.inserted_at
    }
  end

  def render("default.json", %{}) do
    %{}
  end
end
