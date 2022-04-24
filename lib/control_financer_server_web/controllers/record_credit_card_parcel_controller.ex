defmodule ControlFinancerServerWeb.RecordCreditCardParcelController do
  use ControlFinancerServerWeb, :controller

  alias ControlFinancerServer.Records
  alias ControlFinancerServer.Records.RecordCreditCardParcel

  action_fallback ControlFinancerServerWeb.FallbackController

  def index(conn, _params) do
    record_credit_cards_parcel = Records.list_record_credit_cards_parcel()
    render(conn, "index.json", record_credit_cards_parcel: record_credit_cards_parcel)
  end

  def create(conn, %{"record_credit_card_parcel" => record_credit_card_parcel_params}) do
    with {:ok, %RecordCreditCardParcel{} = record_credit_card_parcel} <- Records.create_record_credit_card_parcel(record_credit_card_parcel_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.record_credit_card_parcel_path(conn, :show, record_credit_card_parcel))
      |> render("show.json", record_credit_card_parcel: record_credit_card_parcel)
    end
  end

  def show(conn, %{"id" => id}) do
    record_credit_card_parcel = Records.get_record_credit_card_parcel!(id)
    render(conn, "show.json", record_credit_card_parcel: record_credit_card_parcel)
  end

  def update(conn, %{"id" => id, "record_credit_card_parcel" => record_credit_card_parcel_params}) do
    record_credit_card_parcel = Records.get_record_credit_card_parcel!(id)

    with {:ok, %RecordCreditCardParcel{} = record_credit_card_parcel} <- Records.update_record_credit_card_parcel(record_credit_card_parcel, record_credit_card_parcel_params) do
      render(conn, "show.json", record_credit_card_parcel: record_credit_card_parcel)
    end
  end

  def delete(conn, %{"id" => id}) do
    record_credit_card_parcel = Records.get_record_credit_card_parcel!(id)

    with {:ok, %RecordCreditCardParcel{}} <- Records.delete_record_credit_card_parcel(record_credit_card_parcel) do
      send_resp(conn, :no_content, "")
    end
  end
end
