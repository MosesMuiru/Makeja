defmodule Makeja.OtpWorker do
  alias Makeja.Sms.SmsConfirmation
  alias Makeja.Cache.Cache
  alias Makeja.Repo.UsersRepo
  # this is what will happen here
  # an otp generator for random numbers
  # then use this number will be used to send the number a 

  @type s :: String.t()

  def send_otp(user_id, phone_number) do
    otp =
      (:rand.uniform(9000) + 999)
      |> to_string()

    UsersRepo.get_user_by_phone_number_and_id(user_id, phone_number)
    |> case do
      {:ok, user} ->
        otp
        |> IO.inspect(label: "this si the oottp -->")

        # send the otp
        Task.async(fn -> SmsConfirmation.send_confirmation_sms(phone_number, otp) end)

        Cache.insert_table(Otp, user.uuid, otp, 5 * 1000 * 60)

        true

      nil ->
        IO.inspect("Buda, User doesn't exist")
        false
    end

    # store the number to mnesia
  end

  @spec compare_otp(s, s) :: boolean()
  def compare_otp(user_id, sent_otp) do
    # fetch the otp that has been saved in the mnesia

    Cache.fetch_otp({Otp, user_id})
    |> case do
      {:atomic, [response]} ->
        {_table_name, _user_id, otp} = response
        otp == sent_otp
        true

      {:aborted, {:already_exit, table_name}} ->
        table_name
        |> IO.inspect(label: "Table doesn't exist")

        false
    end
  end
end
