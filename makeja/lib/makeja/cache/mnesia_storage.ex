defmodule Makeja.Cache.MnesiaStorage do
  use GenServer

  # during start

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  # @spec create_table(pid(), {atom(), (table_name, list())}) :: :ok
  def create_table(pid, {:create_table, {_table_name, _list_of_column_names} = message}) do
    GenServer.cast(pid, {:create_table, message})
  end

  # 
  def insert_to_mnesia(pid, {:insert, message}) do
    GenServer.cast(pid, {:insert, message})
  end

  def read_from_mnesia(pid, {_table_name, _fetch_from_mnesia_by} = message) do
    GenServer.call(pid, {:read_from_mnesia, message})
  end

  def init(opts) do
    {:ok, opts}
  end

  def handle_cast({:create_table, {table_name, list_of_column_names} = _message}, state) do
    :mnesia.create_table(table_name, attributes: list_of_column_names)
    |> case do
      {:atomic, :ok} ->
        IO.inspect(label: "table created")

      {:aborted, Reason} ->
        Reason
        |> IO.inspect(label: "__ERROR__")
    end

    {:noreply, state}
  end

  def handle_cast({:insert, message}, state) do
    fn ->
      :mnesia.write(message)
    end
    |> :mnesia.transaction()
    |> case do
      {:atomic, :ok} ->
        IO.inspect(label: "Data inserted")

      {:aborted, reason} ->
        reason
        |> IO.inspect(label: "__error__")
    end

    {:noreply, state}
  end

  def handle_call(
        {:read_from_mnesia, {_table_name, _fetch_from_mnesia_by} = message},
        _from,
        state
      ) do
    data =
      fn ->
        :mnesia.read(message)
      end
      |> :mnesia.transaction()
      |> case do
        {:atomic, data} ->
          data
          |> IO.inspect(label: "this is the data")

        {:aborted, reason} ->
          reason
          |> IO.inspect(label: "__error__")
      end

    {:reply, data, state}
  end
end
