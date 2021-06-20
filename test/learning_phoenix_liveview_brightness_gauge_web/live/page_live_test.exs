defmodule LearningPhoenixLiveviewBrightnessGaugeWeb.PageLiveTest do
  use LearningPhoenixLiveviewBrightnessGaugeWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Welcome to Phoenix!"
    assert render(page_live) =~ "Welcome to Phoenix!"
  end
end
