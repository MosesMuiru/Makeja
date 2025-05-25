defmodule Makeja.Cache.MyCache do
  @doc """
  I am tring to create my own cache here
  """
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  @spec insert_table(pid(), {atom(), {String.t(), any()}}) :: :ok
  def insert_table(pid, {_table_name, {_column_name, _data}} = message) do
    GenServer.cast(pid, {:insert_to_table, message})
  end

  @spec get(pid(), {atom(), String.t()}) :: :ok
  def get(pid, {_table_name, _column_name} = message) do
    GenServer.call(pid, {:get, message})
  end

  @spec delete(pid(), {atom(), String.t()}) :: :ok
  def delete(pid, {_table_name, _column_name} = message) do
    GenServer.cast(pid, {:delete, message})
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

  @impl true
  def init(opts) do
    opts
    |> IO.inspect(label: "----O--")

    # initiate the table
    table_name =
      opts
      |> Keyword.get(:name)
      |> String.to_atom()

    table = :ets.new(table_name, [:set, :protected, :named_table])
    IO.inspect(table, label: "this is the table created")

    {:ok, opts}
  end

  @impl true
  def handle_cast({:insert_to_table, {table_name, {column_name, data}} = _message}, state) do
    IO.inspect(state, label: "this is the state")

    :ets.insert(table_name, {column_name, data})
    |> IO.inspect(label: "The data has been inserted ---->")

    {:noreply, state}
  end

  @impl true
  def handle_cast({:delete, {table_name, column_name} = _message}, state) do
    state
    |> IO.inspect(label: "this si the state")

    confirmation_delete = :ets.delete(table_name, column_name)
    {:noreply, confirmation_delete}
  end

  @impl true
  def handle_call({:get, {table_name, column_name} = _message}, from, state) do
    from
    |> IO.inspect(label: "this is where it is from")

    otp =
      :ets.lookup(table_name, column_name)
      |> IO.inspect(label: "this is the daa in the table ---->")

    {:reply, otp, state}
  end
end
