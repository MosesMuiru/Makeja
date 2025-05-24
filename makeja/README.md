# Makeja

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


# small documentaion of my own redis like cache using ets


how to create a new table in ets
  1. :ets.new(:table_name, [:set, :protected, :Named_table])

  can be able to access table by it's anme

  2. inserting to a new table
    :ets.new(:table_name, {"column_name", "column_data"})

  3. deleting to  a new table
    :ets.delete(:table_name, "column_name")

  
  
  

