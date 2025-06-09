defmodule Makeja.HeaderHTML do
  use MakejaWeb, :html

  embed_templates "header_html"

  def card(assigns) do
    ~H"""
    <h2>there</h2>
    """
  end
end
