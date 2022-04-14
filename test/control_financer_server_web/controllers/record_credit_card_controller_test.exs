defmodule ControlFinancerServerWeb.RecordCreditCardControllerTest do
  use ControlFinancerServerWeb.ConnCase

  import ControlFinancerServer.RecordsFixtures

  alias ControlFinancerServer.Records.RecordCreditCard

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all record_credit_cards", %{conn: conn} do
      conn = get(conn, Routes.record_credit_card_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create record_credit_card" do
    test "renders record_credit_card when data is valid", %{conn: conn} do
      conn = post(conn, Routes.record_credit_card_path(conn, :create), record_credit_card: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.record_credit_card_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.record_credit_card_path(conn, :create), record_credit_card: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update record_credit_card" do
    setup [:create_record_credit_card]

    test "renders record_credit_card when data is valid", %{conn: conn, record_credit_card: %RecordCreditCard{id: id} = record_credit_card} do
      conn = put(conn, Routes.record_credit_card_path(conn, :update, record_credit_card), record_credit_card: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.record_credit_card_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, record_credit_card: record_credit_card} do
      conn = put(conn, Routes.record_credit_card_path(conn, :update, record_credit_card), record_credit_card: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete record_credit_card" do
    setup [:create_record_credit_card]

    test "deletes chosen record_credit_card", %{conn: conn, record_credit_card: record_credit_card} do
      conn = delete(conn, Routes.record_credit_card_path(conn, :delete, record_credit_card))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.record_credit_card_path(conn, :show, record_credit_card))
      end
    end
  end

  defp create_record_credit_card(_) do
    record_credit_card = record_credit_card_fixture()
    %{record_credit_card: record_credit_card}
  end
end
