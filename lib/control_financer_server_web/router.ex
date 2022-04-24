defmodule ControlFinancerServerWeb.Router do
  use ControlFinancerServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ControlFinancerServerWeb do
    pipe_through :api

    resources "/user", UserController, only: [:index, :create, :show]
    resources "/bank", BankController, only: [:index, :create, :show]
    resources "/category", CategoryController, only: [:index, :create, :show]
    resources "/account_bank", AccountBankController, only: [:index, :create, :show]
    resources "/credit_card", CreditCardController, only: [:index, :create, :show]
    resources "/record", RecordController, only: [:index, :create, :show]
    resources "/record_account_bank", RecordAccountBankController, only: [:index, :create, :show]
    resources "/record_credit_card", RecordCreditCardController, only: [:index, :create, :show]
    resources "/record_credit_card_parcel", RecordCreditCardParcelController, only: [:index, :create, :show]

    post "/record_credit_card_all", RecordCreditCardController, :createAll 
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: ControlFinancerServerWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
