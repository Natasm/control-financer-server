defmodule ControlFinancerServerWeb.CreditCardControllerTest do
  use ControlFinancerServerWeb.ConnCase

  import ControlFinancerServer.BanksFixtures

  alias ControlFinancerServer.Banks.CreditCard

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all credit_cards", %{conn: conn} do
      conn = get(conn, Routes.credit_card_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create credit_card" do
    test "renders credit_card when data is valid", %{conn: conn} do
      conn = post(conn, Routes.credit_card_path(conn, :create), credit_card: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.credit_card_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.credit_card_path(conn, :create), credit_card: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update credit_card" do
    setup [:create_credit_card]

    test "renders credit_card when data is valid", %{conn: conn, credit_card: %CreditCard{id: id} = credit_card} do
      conn = put(conn, Routes.credit_card_path(conn, :update, credit_card), credit_card: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.credit_card_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, credit_card: credit_card} do
      conn = put(conn, Routes.credit_card_path(conn, :update, credit_card), credit_card: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete credit_card" do
    setup [:create_credit_card]

    test "deletes chosen credit_card", %{conn: conn, credit_card: credit_card} do
      conn = delete(conn, Routes.credit_card_path(conn, :delete, credit_card))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.credit_card_path(conn, :show, credit_card))
      end
    end
  end

  defp create_credit_card(_) do
    credit_card = credit_card_fixture()
    %{credit_card: credit_card}
  end
end
