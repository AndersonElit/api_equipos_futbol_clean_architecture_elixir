defmodule App.Infrastructure.Adapters.Repository.Equipo.Data.EquipoData do
  use Ecto.Schema
  import Ecto.Changeset

  ## TODO: Add schema definition
  # Types https://hexdocs.pm/ecto/Ecto.Schema.html#module-primitive-types

  schema "equipos" do
    field :nombre, :string
    field :abreviatura, :string
    timestamps()
  end

  @doc false
  def changeset(equipo, attrs) do
    equipo
    |> cast(attrs, [:nombre, :abreviatura])
    |> validate_required([:nombre, :abreviatura])
  end

end
