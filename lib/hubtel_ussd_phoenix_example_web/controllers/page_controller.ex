defmodule HubtelUssdPhoenixExampleWeb.PageController do
  use HubtelUssdPhoenixExampleWeb, :controller

  def index(conn, _params) do
    # read raw POST data from Hubtel
    {:ok, body, _conn} = Plug.Conn.read_body(conn)

    ussdRequest = Jason.decode!(body)

    # check if ussdRequest != nil
    if ussdRequest do
      # get the request type
      case ussdRequest["Type"] do
        # initial request
        "Initiation" ->
          ussdResponse = %{
            Message:
              "Welcome to AquaSafari (" <> ussdRequest["Mobile"] <> ")\n1. Continue\n2. Cancel",
            ClientState: "continue-menu",
            Type: "Response"
          }

          send_resp(conn, :ok, Jason.encode!(ussdResponse))

        # continuing request
        "Response" ->
          # get request sequence
          case ussdRequest["Sequence"] do
            2 ->
              # get the clientState
              case ussdRequest["ClientState"] do
                # if clientState == "continue-menu"
                "continue-menu" ->
                  # check if user input is 1 from home menu
                  if ussdRequest["Message"] == "1" do
                    ussdResponse = %{
                      Message: "Select an option\n1. Book a Room\n2. Contact Us",
                      Type: "Release"
                    }

                    send_resp(conn, :ok, Jason.encode!(ussdResponse))
                  else
                    ussdResponse = %{Message: "Invalid USSD request", Type: "Release"}
                    send_resp(conn, :ok, Jason.encode!(ussdResponse))
                  end
              end
          end
      end
    else
      ussdResponse = %{Message: "Invalid USSD request", Type: "Release"}
      send_resp(conn, :ok, Jason.encode!(ussdResponse))
    end
  end
end
