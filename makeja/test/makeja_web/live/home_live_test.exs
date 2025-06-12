defmodule MakejaWeb.HomeLiveTest do
  use MakejaWeb.ConnCase
  import Phoenix.LiveViewTest

  test "click a button redirects you with it's id", %{conn: conn} do
    id = 2334

    # start the liveview
    {:ok, view, _html} = live(conn, ~p"/home_live")

    # simulae the clicking of the button
    click_result =
      view
      |> element("housesid")
      |> render_click()

    # assrt_redirect()
    assert_redirect(click_result, ~p"/houses?id=#{id}")
  end
end
