defmodule Makeja.AttachmentsTest do
  use Makeja.DataCase
  import Makeja.Factory

  alias Makeja.Repo.AttachmentsRepo

  describe "testig attachments crud queries" do
    setup do
      {:ok, response} = insert(:attachment, uuid: Ecto.UUID.generate(), url: "test url")

      response
      # the below for invalid/file that doesn't exist
    end

    test "Fetch att by uuid", response do
      IO.inspect(response, label: "this is the attachment")
      {:ok, attachment} = AttachmentsRepo.get_attachments_by_id(response.uuid)
      IO.inspect(attachment, label: "this is the attachment")
      assert response.uuid == attachment.uuid
    end
  end
end
