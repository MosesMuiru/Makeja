defmodule Makeja.Factory do
  alias Makeja.Schema.Attachments
  alias Makeja.Repo
  # attachemnt struct
  def build(:attachment) do
    %Attachments{
      uuid: Ecto.UUID.generate(),
      url: "test url"
    }
  end

  # convenience api
  def build(factory_name, attr) do
    factory_name
    |> build()
    |> struct!(attr)
  end

  def insert(factory_name, att) do
    factory_name
    |> build(att)
    |> Repo.insert!()
  end

  def fetch(factory_name, att) do
    {:ok, attachment} =
      factory_name
      |> build()
      |> Repo.get_by(att)

    attachment
  end
end
