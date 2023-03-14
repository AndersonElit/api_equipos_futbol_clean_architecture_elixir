defmodule App.Infrastructure.Adapters.Repository.Repo.Migrations.CrearTablaEquipos do
  use Ecto.Migration

  def change do
    create table(:equipos) do
      add :nombre, :string
      add :abreviatura, :string

      timestamps()
    end
  end
end
