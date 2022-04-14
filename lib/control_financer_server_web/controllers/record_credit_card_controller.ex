defmodule ControlFinancerServerWeb.RecordCreditCardController do
  use ControlFinancerServerWeb, :controller

  alias ControlFinancerServer.Records
  alias ControlFinancerServer.Records.RecordCreditCard

  action_fallback ControlFinancerServerWeb.FallbackController

  def index(conn, _params) do
    record_credit_cards = Records.list_record_credit_cards()
    render(conn, "index.json", record_credit_cards: record_credit_cards)
  end

  def create(conn, %{"record_credit_card" => record_credit_card_params}) do
    with {:ok, %RecordCreditCard{} = record_credit_card} <- Records.create_record_credit_card(record_credit_card_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.record_credit_card_path(conn, :show, record_credit_card))
      |> render("show.json", record_credit_card: record_credit_card)
    end
  end

  def show(conn, %{"id" => id}) do
    record_credit_card = Records.get_record_credit_card!(id)
    render(conn, "show.json", record_credit_card: record_credit_card)
  end

  def update(conn, %{"id" => id, "record_credit_card" => record_credit_card_params}) do
    record_credit_card = Records.get_record_credit_card!(id)

    with {:ok, %RecordCreditCard{} = record_credit_card} <- Records.update_record_credit_card(record_credit_card, record_credit_card_params) do
      render(conn, "show.json", record_credit_card: record_credit_card)
    end
  end

  def delete(conn, %{"id" => id}) do
    record_credit_card = Records.get_record_credit_card!(id)

    with {:ok, %RecordCreditCard{}} <- Records.delete_record_credit_card(record_credit_card) do
      send_resp(conn, :no_content, "")
    end
  end
end
