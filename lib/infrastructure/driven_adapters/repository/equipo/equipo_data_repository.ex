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

  defp to_entity(nil), do: nil
  defp to_entity(data) do
    struct(Equipo, data |> Map.from_struct)
  end

  defp to_data(entity) do
    struct(EquipoData, entity |> Map.from_struct)
  end
end
