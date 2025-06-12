defmodule Makeja.Sms.SmsConfirmation do
  # it should hit my server 
  # then generate the code
  # it should be a random number between 1 - 5
  # then it should be saved to db, at random
  @spec send_confirmation_sms(String.t(), String.t()) :: any()
  def send_confirmation_sms(phone_number, message) do
    headers = [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{System.get_env("TIARA_KEY")}"}
    ]

    body =
      %{
        from: "CONNECT",
        to: phone_number,
        message: "Welcome TO Makeja, Here is you Code: \n #{message}",
        messageType: "1"
      }
      |> Jason.encode!()

    Finch.build(:post, "https://api2.tiaraconnect.io/api/messaging/sendsms", headers, body)
    |> Finch.request(Makeja.Finch)
    |> case do
      {:ok, response} ->
        response
    end
  end
end
