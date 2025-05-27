defmodule Makeja.Cache.Cache do
  # create a table of course
  alias Makeja.Cache.MnesiaStorage

  def create_table(table_name, id, otp) do
    MnesiaStorage.create_table(MnesiaStorage, {table_name, [id, otp]})
  end

  def insert_table(table_name, id, otp, ttl) do
    MnesiaStorage.insert_to_mnesia(MnesiaStorage, {table_name, id, otp, ttl})
  end

  def fetch_otp({_table_name, _id} = request) do
    MnesiaStorage.read_from_mnesia(MnesiaStorage, request)
  end
end
