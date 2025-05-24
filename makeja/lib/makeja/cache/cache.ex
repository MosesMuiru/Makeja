defmodule Makeja.Cache.Cache do
  @doc """
  I am tring to create my own cache here
  """
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def insert_table(pid, {column_name, data} = message) do
    GenServer.cast(pid, {:insert_to_table, message})
  end

  @impl true
  def init(table_name) do
    # here i should create a table of that user
    table_name
    |> IO.inspect(label: "this is the table name")

    {:ok, table_name}
  end
end
