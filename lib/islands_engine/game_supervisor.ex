defmodule IslandsEngine.GameSupervisor do
  use Supervisor
  alias IslandsEngine.Game

  def start_game(name) do
    # using this module, return a started supervisor process PID.
    # that process will use the child spec we defined in init.
    # name argument (here) is passed to child spec's module (Game) start_link
    #   to start and supervise the game
    Supervisor.start_child(__MODULE__, [name])
  end

  def init(:ok) do
    # child spec that tells a supervisor to use the Game module
    # and the start_link to start the child
    Supervisor.init([Game], strategy: :simple_one_for_one)
  end

  def start_link(_options) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def stop_game(name) do
    :ets.delete(:game_state, name)
    Supervisor.terminate_child(__MODULE__, pid_from_name(name))
  end

  defp pid_from_name(name) do
    name
    |> Game.via_tuple()
    |> GenServer.whereis()
  end
end
