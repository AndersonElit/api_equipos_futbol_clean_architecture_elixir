defmodule App.Domain.Behaviours.EquipoBehaviour do

  alias App.Domain.Model.Equipo

  @callback crear_equipo(Equipo.t())::{:ok, Equipo.t()} | {:error, atom()}

  @callback buscar_equipo_por_id(number())::{:ok, Equipo.t()} | {:error, atom()}

  @callback actualizar_equipo(Equipo.t())::{:ok, Equipo.t()} | {:error, atom()}

end
