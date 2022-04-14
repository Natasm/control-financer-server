defmodule ControlFinancerServerWeb.RecordAccountBankController do
  use ControlFinancerServerWeb, :controller

  alias ControlFinancerServer.Records
  alias ControlFinancerServer.Records.RecordAccountBank

  action_fallback ControlFinancerServerWeb.FallbackController

  def index(conn, _params) do
    record_account_banks = Records.list_record_account_banks()
    render(conn, "index.json", record_account_banks: record_account_banks)
  end

  def create(conn, %{"record_account_bank" => record_account_bank_params}) do
    with {:ok, %RecordAccountBank{} = record_account_bank} <- Records.create_record_account_bank(record_account_bank_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.record_account_bank_path(conn, :show, record_account_bank))
      |> render("show.json", record_account_bank: record_account_bank)
    end
  end

  def show(conn, %{"id" => id}) do
    record_account_bank = Records.get_record_account_bank!(id)
    render(conn, "show.json", record_account_bank: record_account_bank)
  end

  def update(conn, %{"id" => id, "record_account_bank" => record_account_bank_params}) do
    record_account_bank = Records.get_record_account_bank!(id)

    with {:ok, %RecordAccountBank{} = record_account_bank} <- Records.update_record_account_bank(record_account_bank, record_account_bank_params) do
      render(conn, "show.json", record_account_bank: record_account_bank)
    end
  end

  def delete(conn, %{"id" => id}) do
    record_account_bank = Records.get_record_account_bank!(id)

    with {:ok, %RecordAccountBank{}} <- Records.delete_record_account_bank(record_account_bank) do
      send_resp(conn, :no_content, "")
    end
  end
end
