defmodule ControlFinancerServerWeb.RecordAccountBankControllerTest do
  use ControlFinancerServerWeb.ConnCase

  import ControlFinancerServer.RecordsFixtures

  alias ControlFinancerServer.Records.RecordAccountBank

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all record_account_banks", %{conn: conn} do
      conn = get(conn, Routes.record_account_bank_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create record_account_bank" do
    test "renders record_account_bank when data is valid", %{conn: conn} do
      conn = post(conn, Routes.record_account_bank_path(conn, :create), record_account_bank: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.record_account_bank_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.record_account_bank_path(conn, :create), record_account_bank: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update record_account_bank" do
    setup [:create_record_account_bank]

    test "renders record_account_bank when data is valid", %{conn: conn, record_account_bank: %RecordAccountBank{id: id} = record_account_bank} do
      conn = put(conn, Routes.record_account_bank_path(conn, :update, record_account_bank), record_account_bank: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.record_account_bank_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, record_account_bank: record_account_bank} do
      conn = put(conn, Routes.record_account_bank_path(conn, :update, record_account_bank), record_account_bank: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete record_account_bank" do
    setup [:create_record_account_bank]

    test "deletes chosen record_account_bank", %{conn: conn, record_account_bank: record_account_bank} do
      conn = delete(conn, Routes.record_account_bank_path(conn, :delete, record_account_bank))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.record_account_bank_path(conn, :show, record_account_bank))
      end
    end
  end

  defp create_record_account_bank(_) do
    record_account_bank = record_account_bank_fixture()
    %{record_account_bank: record_account_bank}
  end
end
