defmodule ControlFinancerServerWeb.BankController do
  use ControlFinancerServerWeb, :controller

  alias ControlFinancerServer.Banks
  alias ControlFinancerServer.Banks.Bank

  action_fallback ControlFinancerServerWeb.FallbackController

  def index(conn, _params) do
    banks = Banks.list_banks()
    render(conn, "index.json", banks: banks)
  end

  def create(conn, %{"bank" => bank_params}) do
    with {:ok, %Bank{} = bank} <- Banks.create_bank(bank_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.bank_path(conn, :show, bank))
      |> render("show.json", bank: bank)
    end
  end

  def show(conn, %{"id" => id}) do
    bank = Banks.get_bank!(id)
    render(conn, "show.json", bank: bank)
  end

  def update(conn, %{"id" => id, "bank" => bank_params}) do
    bank = Banks.get_bank!(id)

    with {:ok, %Bank{} = bank} <- Banks.update_bank(bank, bank_params) do
      render(conn, "show.json", bank: bank)
    end
  end

  def delete(conn, %{"id" => id}) do
    bank = Banks.get_bank!(id)

    with {:ok, %Bank{}} <- Banks.delete_bank(bank) do
      send_resp(conn, :no_content, "")
    end
  end
end
