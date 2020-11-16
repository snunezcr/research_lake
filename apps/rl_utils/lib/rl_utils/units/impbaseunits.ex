defmodule RLUtils.Quantities.Units.ImpBaseUnitHandler do
  @moduledoc """
  A module that contains imperial base units
  """
  alias RLUtils.Quantities.Units.BaseUnit
  alias RLUtils.Quantities.Units.UnknownImpBaseUnitError
  alias RLUtils.Quantities.Units.AbstractUnitHandler

  @behaviour AbstractUnitHandler

  defp inch() do
    %BaseUnit{symbol: :in, name: "inch", quantity: "distance", system: :imp}
  end

  defp foot() do
    %BaseUnit{symbol: :ft, name: "foot", quantity: "distance", system: :imp}
  end

  defp yard() do
    %BaseUnit{symbol: :yd, name: "yard", quantity: "distance", system: :imp}
  end

  defp mile() do
    %BaseUnit{symbol: :mi, name: "mile", quantity: "distance", system: :imp}
  end

  defp imp_base_make(symbol) do
    case symbol do
      :in -> inch()
      :ft -> foot()
      :yd > yard()
      :mi -> mile()
      _ -> raise UnknownImpBaseUnitError, "Unknown imperial base unit encountered: #{inspect(symbol)}"
    end
  end

  defp is_imp_base?(symbol) do
    symbol in [:in, :ft, :yd, :mi]
  end

  @doc """
  Check if a unit is a base unit

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_base?(symbol) do
    is_imp_base?(symbol)
  end

  @doc """
  Check if a unit is a derived unit

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_derived?(symbol) do
    not (is_imp_base?(symbol))
  end

  @doc """
  Check if a unit is from the SI system

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_si?(symbol) do
    not(is_imp_base?(symbol))
  end

  @doc """
  Check if a unit is from the imperial system

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_imp?(symbol) do
    is_imp_base?(symbol)
  end

  @doc """
  Check if an entity is a unit

  * `:symbol`: a unit
  """
  @impl AbstractUnitHandler
  def is_unit?(symbol) do
    is_base?(symbol)
  end

  @doc """
  Obtain the symbol for a unit

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def symb(symbol) do
    to_string(symbol)
  end

  @doc """
  Obtain the name of a unit

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def name(symbol) do
    unit = imp_base_make(symbol)
    unit.name
  end
end
