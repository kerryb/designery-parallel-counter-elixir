defmodule ParallelSum.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  use Application

  alias ParallelSum.Counter
  alias ParallelSum.Total

  @impl true
  def start(_type, _args) do
    children = [
      {Counter, [name: Counter]},
      {Total, [name: Total]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ParallelSum.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
