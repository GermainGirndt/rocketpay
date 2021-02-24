defmodule RocketpayWeb.WelcomeController do

  # declare that it is a special CONTROLLER module
  use RocketpayWeb, :controller

  # set alias to Numbers
  alias Rocketpay.Numbers

  # Receive connections and parameter
  # (_parameter = we will not use this one)
  def index(conn, %{"filename" => filename}) do
    #text(conn, "Welcome to the Rocketpay API")

    filename
      |> Numbers.sum_from_file()
      |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
      |> put_status(:ok)
      |> json(%{message: "Welcome to Rocketpay API. Here is your number #{result}"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
