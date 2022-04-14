defmodule ControlFinancerServerWeb.AccountBankController do
  use ControlFinancerServerWeb, :controller

  alias ControlFinancerServer.Banks
  alias ControlFinancerServer.Banks.AccountBank

  action_fallback ControlFinancerServerWeb.FallbackController

  def index(conn, _params) do
    account_banks = Banks.list_account_banks()
    render(conn, "index.json", account_banks: account_banks)
  end

  def create(conn, %{"account_bank" => account_bank_params}) do
    with {:ok, %AccountBank{} = account_bank} <- Banks.create_account_bank(account_bank_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.account_bank_path(conn, :show, account_bank))
      |> render("show.json", account_bank: account_bank)
    end
  end

  def show(conn, %{"id" => id}) do
    account_bank = Banks.get_account_bank!(id)
    render(conn, "show.json", account_bank: account_bank)
  end

  def update(conn, %{"id" => id, "account_bank" => account_bank_params}) do
    account_bank = Banks.get_account_bank!(id)

    with {:ok, %AccountBank{} = account_bank} <- Banks.update_account_bank(account_bank, account_bank_params) do
      render(conn, "show.json", account_bank: account_bank)
    end
  end

  def delete(conn, %{"id" => id}) do
    account_bank = Banks.get_account_bank!(id)

    with {:ok, %AccountBank{}} <- Banks.delete_account_bank(account_bank) do
      send_resp(conn, :no_content, "")
    end
  end
end
