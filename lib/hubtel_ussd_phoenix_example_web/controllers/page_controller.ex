defmodule HubtelUssdPhoenixExampleWeb.PageController do
  use HubtelUssdPhoenixExampleWeb, :controller

  def index(conn, _params) do

  	# read raw POST data from Hubtel
  	{:ok, body, _conn} = Plug.Conn.read_body(conn)

  	ussdRequest = Jason.decode!(body)

  	ussdResponse = %{
	    Message: "Welcome to AquaSafari (" <> ussdRequest["Mobile"] <> ")\n1. Continue\n2. Cancel",
	    Type: "Release"
	}

  	send_resp(conn, :ok, Jason.encode!(ussdResponse))

  end
end
