defmodule RocketpayWeb.WelcomeController do

  # declare that it is a special CONTROLLER module
  use RocketpayWeb, :controller


  # Receive connections and parameter
  # (_parameter = we will not use this one)
  def index(conn, _params) do
    text(conn, "Welcome to the Rocketpay API")
  end
end
