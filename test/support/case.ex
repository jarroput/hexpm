defmodule Hexpm.Case do
  def key_for(user_or_organization) do
    key =
      user_or_organization
      |> Hexpm.Accounts.Key.build(%{name: "any_key_name"})
      |> Hexpm.Repo.insert!()

    key.user_secret
  end

  def read_fixture(path) do
    Path.join([__DIR__, "..", "fixtures", path])
    |> File.read!()
  end

  def audit_data(user) do
    {user, "TEST"}
  end

  def default_meta(name, version) do
    %{
      "name" => name,
      "description" => "description",
      "licenses" => [],
      "version" => version,
      "requirements" => [],
      "app" => name,
      "build_tools" => ["mix"],
      "files" => ["mix.exs"]
    }
  end

  def default_requirement(name, requirement) do
    %{"name" => name, "app" => name, "requirement" => requirement, "optional" => false}
  end
end
