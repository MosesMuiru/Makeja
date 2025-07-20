defmodule Makeja.Repo.AttachmentsRepo do
  alias Makeja.Repo
  alias Makeja.Schema.Attachments

  @type t :: Attachments.t()
  @type e :: Ecto.Changeset.t()

  @spec insert_at(String.t()) :: {:ok, t} | {:error, e}
  def insert_at(upload_url) do
    %Attachments{}
    |> Attachments.changeset(%{url: upload_url})
    |> Repo.insert()
  end

  @spec get_attachments_by_id(String.t()) :: Attachments.t() | nil
  def get_attachments_by_id(id) do
    Attachments
    |> Repo.get_by(uuid: id)
  end

  def get_all_attachments() do
    Attachments
    |> Repo.all()
    |> Repo.preload(:attachments)
  end
end
