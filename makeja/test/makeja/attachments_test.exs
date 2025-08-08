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
      {:ok, attachment} = AttachmentsRepo.get_attachments_by_id(response.uuid)
      assert response.uuid == attachment.uuid
    end
  end
end
