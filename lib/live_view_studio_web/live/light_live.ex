# Arquivo CRIADO

defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Front Porch Light</h1>
    <div class="meter">
    <span style="width: <%= @brightness %>%">
      <%= @brightness %>%
    </span>
    </div>


    <button phx-click="off">
      <img src="images/light-off.svg">
    </button>


    <button phx-click="down">
      <img src="images/down.svg">
    </button>
       <button phx-click="up" >
      <img src="images/up.svg"> 
    </button>



    <button phx-click="on">
    <img src="images/light-on.svg">
    </button>

    """
  end

  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    IO.puts("==============================================")
    IO.inspect(socket)
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    IO.puts("==============================================")
    IO.inspect(socket)
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    brightness = socket.assigns.brightness + 10
    socket = assign(socket, :brightness, brightness)
    IO.puts("==============================================")
    IO.inspect(socket)
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    # brightness = socket.assigns.brightness - 10
    # outra forma 
    socket = update(socket, :brightness, &(&1 - 10))
    IO.puts("==============================================")
    IO.inspect(socket)
    {:noreply, socket}
  end
end
