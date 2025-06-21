defmodule Makeja.Cloudinary do
  alias Makeja.Repo.AttachmentsRepo

  @spec upload_to_cloud(String.t()) :: any()
  def upload_to_cloud(file_url) do
    Cloudex.upload(file_url)
    |> case do
      {:ok, response} ->
        response
        |> IO.inspect(label: "response -->")

        response.url
        |> AttachmentsRepo.insert_at()

        response.url

      # the url is set to the database
      {:error, reason} ->
        reason
    end
  end
end
