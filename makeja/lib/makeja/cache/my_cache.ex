defmodule Makeja.Cache.MyCache do
  @doc """
  I am tring to create my own cache here
  """
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def insert_table(pid, {_column_name, _data} = message) do
    IO.inspect(message, label: "this is the name")
    GenServer.cast(pid, {:insert_to_table, message})
  end

  def k(state, table_name) do
    state
    |> IO.inspect(label: "this is wroking to initialise the table")

    table_name
    |> String.to_atom()
    |> :ets.new([:set, :protected, :named_table])
    |> case do
      table_name ->
        table_name
        |> IO.inspect(label: "Table initialised as ")
    end

    # here i should create a table of that user

    {:ok, state}
  end

  def init(opts) do
    opts
    |> IO.inspect(label: "----O--")

    {:ok, opts}
  end

  @impl true
  def handle_cast({:insert_to_table, message}, state) do
    IO.inspect(message, label: "this is the message")
    IO.inspect(state, label: "this is the state")
    {:noreply, state}
  end
end
