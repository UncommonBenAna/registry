defmodule BenanachainRegistry.PageView do
  use BenanachainRegistry.Web, :view

  def render(conn, %{nodes: nodes}) do
    %{
      nodes: Enum.map(nodes, &node_json/1)
    }
  end

  defp node_json(node) do
    %{
      id: node.id,
      ip: node.ip
    }
  end
end
