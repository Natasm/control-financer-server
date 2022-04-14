defmodule ControlFinancerServerWeb.AccountBankControllerTest do
  use ControlFinancerServerWeb.ConnCase

  import ControlFinancerServer.BanksFixtures

  alias ControlFinancerServer.Banks.AccountBank

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all account_banks", %{conn: conn} do
      conn = get(conn, Routes.account_bank_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create account_bank" do
    test "renders account_bank when data is valid", %{conn: conn} do
      conn = post(conn, Routes.account_bank_path(conn, :create), account_bank: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.account_bank_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.account_bank_path(conn, :create), account_bank: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update account_bank" do
    setup [:create_account_bank]

    test "renders account_bank when data is valid", %{conn: conn, account_bank: %AccountBank{id: id} = account_bank} do
      conn = put(conn, Routes.account_bank_path(conn, :update, account_bank), account_bank: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.account_bank_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, account_bank: account_bank} do
      conn = put(conn, Routes.account_bank_path(conn, :update, account_bank), account_bank: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete account_bank" do
    setup [:create_account_bank]

    test "deletes chosen account_bank", %{conn: conn, account_bank: account_bank} do
      conn = delete(conn, Routes.account_bank_path(conn, :delete, account_bank))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.account_bank_path(conn, :show, account_bank))
      end
    end
  end

  defp create_account_bank(_) do
    account_bank = account_bank_fixture()
    %{account_bank: account_bank}
  end
end
