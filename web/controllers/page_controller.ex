defmodule BenanachainRegistry.PageController do
  use BenanachainRegistry.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def register(conn, _params) do
    cs = BenanachainRegistry.Node.changeset(%BenanachainRegistry.Node{}, %{ip: conn |> conn_ip})

    {:ok, node} = Repo.insert cs

    conn |> put_status(:created) |> render "node.json", nodes: [node]
  end

  def deregister(conn, _params) do
    import Ecto.Query, only: [from: 2]
    cs = BenanachainRegistry.Node.changeset(%BenanachainRegistry.Node{ip: conn |> conn_ip}, %{})

    ip = conn |> conn_ip

    node = Repo.one(from n in BenanachainRegistry.Node, where: n.ip == ^ip)
    
    if node != nil do
      Repo.delete node
    end

    conn |> send_resp(400, "")
  end

  def nodes(conn, _params) do 
    render conn, "nodes.json", nodes: Repo.all(BenanachainRegistry.Node)
  end

  defp conn_ip(conn) do
    %Plug.Conn{peer: {{a, b, c, d}, _}} = conn
    ip = "#{a}.#{b}.#{c}.#{d}"
  end
end
