defmodule App.Domain.Model.Equipo do

  defstruct [
    :id,
    :nombre,
    :abreviatura
  ]
  @type t() :: %__MODULE__{id: number(), nombre: String.t(), abreviatura: String.t()}

  def new(id, nombre, abreviatura) when(is_nil(id)) do
    {
      :ok,
      %__MODULE__{
        id: id,
        nombre: nombre,
        abreviatura: abreviatura
      }
    }
  end

  def new(id, nombre, abreviatura) do
    {
      :ok,
      %__MODULE__{
        id: id,
        nombre: nombre,
        abreviatura: abreviatura
      }
    }
  end


end
