defmodule BenanachainRegistry.NodeTest do
  use BenanachainRegistry.ModelCase

  alias BenanachainRegistry.Node

  @valid_attrs %{ip: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Node.changeset(%Node{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Node.changeset(%Node{}, @invalid_attrs)
    refute changeset.valid?
  end
end
