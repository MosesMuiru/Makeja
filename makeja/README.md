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
  1. :ets.new(:table_name, [:set, :protected, :named_table])

  can be able to access table by it's anme

  2. inserting to a new table
    :ets.insert_at(:table_name, {"column_name", "column_data"})

  3. deleting to  a new table
    :ets.delete(:table_name, "column_name")

# crud operations in mnesia database
  1. starting mnesia database
    :mnesia.create_schema([node()])
    :mnesia.start() -> this will start the databse

  2. Create table
   :mnesia.create(table_name, [attributes: [:column_name, :column_name]])

   add indexes
   :mnesia.add_table_index(Person, :column_name)

  3. insert elments in table
    :mnesia.write({Person, :column_id, :column_name, :column_name})
  
  4. 
    
    


  
  
  

