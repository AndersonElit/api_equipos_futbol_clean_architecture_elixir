defmodule App.Domain.UseCase.EquipoUseCase do
alias App.Domain.Model.Equipo
require Logger

  @equipos_behaviour Application.compile_env(:app, :equipos_behaviour)

  def crear_equipo(info) do

    with {:ok, equipo} <- Equipo.new(nil, Map.get(info, :nombre), Map.get(info, :abreviatura)),
          {:ok, nuevo_equipo} <- @equipos_behaviour.crear_equipo(equipo) do
      Logger.info("Nuevo equipo #{inspect(nuevo_equipo)}")
      {:ok, nuevo_equipo}
    end

  end

  def buscar_equipo_por_id(id) do
    with {:ok, equipo} <- @equipos_behaviour.buscar_equipo_por_id(id) do
      Logger.info("equipo #{inspect(equipo)}")
      {:ok, equipo}
    end
  end

  def actualizar_equipo(info) do

    with {:ok, equipo} <- Equipo.new(Map.get(info, :id), Map.get(info, :nombre), Map.get(info, :abreviatura)),
          {:ok, equipo_actualizado} <- @equipos_behaviour.actualizar_equipo(equipo) do
      Logger.info("Nuevo equipo #{inspect(equipo_actualizado)}")
      {:ok, equipo_actualizado}
    end

  end

end
