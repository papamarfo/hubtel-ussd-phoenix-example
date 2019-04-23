defmodule HubtelUssdPhoenixExampleWeb.PageController do
  use HubtelUssdPhoenixExampleWeb, :controller

  def index(conn, _params) do
    # read raw POST data from Hubtel
    {:ok, body, _conn} = Plug.Conn.read_body(conn)

    ussd_request = Jason.decode!(body)

    # check if ussd_request != nil
    if ussd_request do
      # get the request type
      case ussd_request["Type"] do
        # initial request
        "Initiation" ->
          ussd_response = %{
            Message:
              "Welcome to AquaSafari (" <> ussd_request["Mobile"] <> ")\n1. Continue\n2. Cancel",
            ClientState: "continue-menu",
            Type: "Response"
          }

          send_response(conn, :ok, ussd_response)

        # continuing request
        "Response" ->
          # get request sequence
          case ussd_request["Sequence"] do
            2 ->
              # get the clientState
              case ussd_request["ClientState"] do
                # if clientState == "continue-menu"
                "continue-menu" ->
                  # check if user input is 1 from home menu
                  if ussd_request["Message"] == "1" do
                    ussd_response = %{
                      Message: "Select an option\n1. Book a Room\n2. Contact Us",
                      Type: "Release"
                    }

                    send_response(conn, :ok, ussd_response)
                  else
                    ussd_response = %{
                      Message: "Invalid USSD request", 
                      Type: "Release"
                    }

                    send_response(conn, :ok, ussd_response)
                  end
              end
          end
      end
    else
      ussd_response = %{
        Message: "Invalid USSD request",
        Type: "Release"
      }
      
      send_response(conn, :ok, ussd_response)
    end
  end

  def send_response(conn, :ok, ussd_response) do
    send_resp(conn, :ok, Jason.encode!(ussd_response))
  end
end
