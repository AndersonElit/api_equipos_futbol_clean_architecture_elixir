defmodule App.Infrastructure.Adapters.Repository.Equipo.EquipoDataRepository do
  alias App.Infrastructure.Adapters.Repository.Repo
  alias App.Infrastructure.Adapters.Repository.Equipo.Data.EquipoData
  alias App.Domain.Model.Equipo

  @behaviour App.Domain.Behaviours.EquipoBehaviour

  def buscar_equipo_por_id(id), do: EquipoData |> Repo.get(id) |> to_entity

  def crear_equipo(entity) do
    case to_data(entity) |> Repo.insert do
      {:ok, entity} -> {:ok, entity |> to_entity()}
      error -> error
    end
  end

  def actualizar_equipo(entity) do
    id = Map.get(entity, :id)
    equipo_data = Repo.get!(EquipoData, id)
    changeset = EquipoData.changeset(equipo_data, %{nombre: Map.get(entity, :nombre), abreviatura: Map.get(entity, :abreviatura)})
    equipo_actualizado = Repo.update(changeset)
    {:ok, %App.Infrastructure.Adapters.Repository.Equipo.Data.EquipoData{id: id, nombre: nombre, abreviatura: abreviatura}} = equipo_actualizado
    {:ok, %Equipo{id: id, nombre: nombre, abreviatura: abreviatura}}
  end

  defp to_entity(nil), do: nil
  defp to_entity(data) do
    struct(Equipo, data |> Map.from_struct)
  end

  defp to_data(entity) do
    struct(EquipoData, entity |> Map.from_struct)
  end
end
