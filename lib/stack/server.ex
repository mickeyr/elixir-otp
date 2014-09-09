defmodule Stack.Server do
  use GenServer
  
  def start_link(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack, name: __MODULE__)
  end
  
  def push(item) do
    GenServer.cast __MODULE__, {:push, item}
  end
  
  def pop do
    GenServer.call __MODULE__, :pop
  end
  
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
  
  def handle_cast({:push, value}, stack) do
    {:noreply, [value | stack]}
  end
  
  def terminate(reason, state) do
    IO.puts reason
  end
end