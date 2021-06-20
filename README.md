# Learning Phoenix Liveview

## Add page

Add live route in `lib/learning_phoenix_liveview_brightness_gauge_web/router.ex`

-> live_macro "path", LiveViewModule
ex: `live "/light", LightLive`

```elixir
defmodule LearningPhoenixLiveviewBrightnessGaugeWeb.Router do
  use LearningPhoenixLiveviewBrightnessGaugeWeb, :router

  ...

  scope "/", LearningPhoenixLiveviewBrightnessGaugeWeb do
    pipe_through :browser

    live "/", PageLive, :index
    # Add live view route:
    live "/light", LightLive
  end
  ...
```

Define the module `light_live.ex` in `lib/learning_phoenix_liveview_brightness_gauge_web/live`

```elixir
defmodule LearningPhoenixLiveviewBrightnessGaugeWeb.LightLive do
  use LearningPhoenixLiveviewBrightnessGaugeWeb, :live_view
end
```
