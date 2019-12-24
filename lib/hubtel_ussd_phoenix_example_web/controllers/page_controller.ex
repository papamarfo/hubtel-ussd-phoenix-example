defmodule HubtelUssdPhoenixExampleWeb.PageController do
  use HubtelUssdPhoenixExampleWeb, :controller

  def index(conn, _params) do
    # get request params
    {:ok, body, _conn} = Plug.Conn.read_body(conn)
    request = Jason.decode!(body)

    if request do
      case request["Type"] do
        
        "Initiation" -> # initial request
          conn |> show_welcome_menu # show welcome menu

        "Response" -> # continuing request
          case request["Sequence"] do
            2 ->
              case request["ClientState"] do
                "last-menu" ->
                  if request["Message"] == "1" do
                    conn |> show_last_menu # show last menu
                  end
                  
                  conn |> show_invalid_selection # show invalid selection
              end
          end
      end
    end
    
    conn |> show_invalid_selection # show invalid selection
  end

  # show welcome menu
  def show_welcome_menu(conn) do
    response = %{
      Message: "Welcome Message \n\n1. Continue\n2. Cancel",
      ClientState: "last-menu",
      Type: "Response"
    }
    send_response(conn, response)
  end

  # show last menu
  def show_last_menu(conn) do
    response = %{
      Message: "Last Menu",
      Type: "Release"
    }
    send_response(conn, response)
  end

  # show invalid selection menu
  def show_invalid_selection(conn) do
    response = %{Message: "Invalid selection", Type: "Release"}
    send_response(conn, response)
  end

  # send response to service provider
  def send_response(conn, response) do
    send_resp(conn, :ok, Jason.encode!(response))
  end
end