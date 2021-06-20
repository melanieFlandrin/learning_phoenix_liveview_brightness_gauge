defmodule LearningPhoenixLiveviewBrightnessGaugeWeb.LightLive do
  use LearningPhoenixLiveviewBrightnessGaugeWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <h1 class="text-4xl font-extrabold mb-8 text-center text-gray-900">Brightness Gauge</h1>
      <div class="mx-auto max-w-xl text-center">
        <div class="bg-gray-200 rounded-lg flex h-12 text-base mb-8 overflow-hidden">
          <span class="bg-yellow-300 flex flex-col justify-center text-center font-bold text-gray-900" style="width: <%= @brightness %>%; transition: width 2s ease;">
            <span class="px-3">
              <%= @brightness %>%
            </span>
          </span>
        </div>

        <div class="flex flex-row justify-center space-x-6">
          <button phx-click="off" id="light-off" phx-hook="buttonOffEvent" class="hover:text-gray-400 hover:bg-white hover:shadow-xl text-gray-500 h-16 w-16 flex justify-center items-center rounded-lg shadow-lg bg-gray-50">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 20 20" fill="currentColor">
              <path d="M11 3a1 1 0 10-2 0v1a1 1 0 102 0V3zM15.657 5.757a1 1 0 00-1.414-1.414l-.707.707a1 1 0 001.414 1.414l.707-.707zM18 10a1 1 0 01-1 1h-1a1 1 0 110-2h1a1 1 0 011 1zM5.05 6.464A1 1 0 106.464 5.05l-.707-.707a1 1 0 00-1.414 1.414l.707.707zM5 10a1 1 0 01-1 1H3a1 1 0 110-2h1a1 1 0 011 1zM8 16v-1h4v1a2 2 0 11-4 0zM12 14c.015-.34.208-.646.477-.859a4 4 0 10-4.954 0c.27.213.462.519.476.859h4.002z" />
            </svg>
          </button>

          <button phx-click="down" id="down" phx-hook="buttonDownEvent" class="hover:text-gray-300 hover:bg-white hover:shadow-xl text-gray-400 h-16 w-16 flex justify-center items-center rounded-lg shadow-lg bg-gray-50">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
          </button>

          <button phx-click="up" id="up" phx-hook="buttonUpEvent" class="hover:text-gray-300 hover:bg-white hover:shadow-xl text-gray-400 h-16 w-16 flex justify-center items-center rounded-lg shadow-lg bg-gray-50">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7" />
            </svg>
          </button>

          <button phx-click="on" id="light-on" phx-hook="buttonOnEvent" class="hover:text-yellow-200 hover:bg-white hover:shadow-xl text-yellow-300 h-16 w-16 flex justify-center items-center rounded-lg shadow-lg bg-gray-50">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 20 20" fill="currentColor">
              <path d="M11 3a1 1 0 10-2 0v1a1 1 0 102 0V3zM15.657 5.757a1 1 0 00-1.414-1.414l-.707.707a1 1 0 001.414 1.414l.707-.707zM18 10a1 1 0 01-1 1h-1a1 1 0 110-2h1a1 1 0 011 1zM5.05 6.464A1 1 0 106.464 5.05l-.707-.707a1 1 0 00-1.414 1.414l.707.707zM5 10a1 1 0 01-1 1H3a1 1 0 110-2h1a1 1 0 011 1zM8 16v-1h4v1a2 2 0 11-4 0zM12 14c.015-.34.208-.646.477-.859a4 4 0 10-4.954 0c.27.213.462.519.476.859h4.002z" />
            </svg>
          </button>
        </div>

      </div>
    """
  end

  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    socket = push_event(socket, "buttonOnEvent", %{pourcent: socket.assigns.brightness});
    {:noreply, socket}
  end


  def handle_event("up", _, socket) do
    socket = update(socket, :brightness, &(&1 + 10))
    socket = push_event(socket, "buttonUpEvent", %{pourcent: socket.assigns.brightness});
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    socket = update(socket, :brightness, &(&1 - 10))
    socket = push_event(socket, "buttonDownEvent", %{pourcent: socket.assigns.brightness});
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    socket = push_event(socket, "buttonOffEvent", %{pourcent: socket.assigns.brightness});
    {:noreply, socket}
  end
end
