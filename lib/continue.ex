defmodule Continue do
  use GenServer
  
  def init(initial_state) do
    {:ok, initial_state, {:continue, :initial_load}}
  end
  
  def start_link(initial_state) do
    GenServer.start_link(__MODULE__, initial_state)
  end
  
  def handle_continue(:initial_load,  state) do
    {:noreply, state |> fetch_initial_state}
  end
  
  def handle_info(:initial_load,  state) do
    {:noreply, state |> fetch_initial_state}
  end
  
  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end
  
  def fetch_initial_state(state) do
    Process.sleep(4_000)
    
    Map.put(state, :initial, :preload)
  end
end
