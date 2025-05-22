defmodule Makeja.Repo.AttachmentsRepo do
  alias Makeja.Repo
  alias Makeja.Schema.Attachments

  def insert(upload_url) do
    %Attachments{}
    |> Attachments.changeset(%{url: upload_url})
    |> Repo.insert()
  end
end
