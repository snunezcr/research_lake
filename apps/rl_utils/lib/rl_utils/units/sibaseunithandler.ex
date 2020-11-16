defmodule RLUtils.Quantities.Units.SIBaseUnits do
  @moduledoc """
  A module that contains SI base units
  """
  alias RLUtils.Quantities.Units.BaseUnit
  alias RLUtils.Quantities.Units.UnknownSIBaseUnitError
  alias RLUtils.Quantities.Units.AbstractUnitHandler

  @behaviour AbstractUnitHandler

  # Standard SI units
  defp second() do
    %BaseUnit{symbol: :s, name: "second", quantity: "time", system: :si}
  end

  defp meter() do
    %BaseUnit{symbol: :m, name: "meter", quantity: "distance", system: :si}
  end

  defp kilogram() do
    %BaseUnit{symbol: :kg, name: "kilogram", quantity: "mass", system: :si}
  end

  defp ampere() do
    %BaseUnit{symbol: :A, name: "ampere", quantity: "electric current", system: :si}
  end

  defp kelvin() do
    %BaseUnit{symbol: :K, name: "kelvin", quantity: "thermodynamic temperature", system: :si}
  end

  defp mole() do
    %BaseUnit{symbol: :mol, name: "mole", quantity: "amount of substance", system: :si}
  end

  defp candela() do
    %BaseUnit{symbol: :cd, name: "candela", quantity: "luminous intensity", system: :si}
  end

  defp si_base_make(symbol) do
    case symbol do
      :s -> second()
      :m -> meter()
      :kg > kilogram()
      :A -> ampere()
      :K -> kelvin()
      :mol -> mole()
      :cd -> candela()
      _ -> raise UnknownSIBaseUnitError, "Unknown SI base unit encountered: #{inspect(symbol)}"
    end
  end

  defp is_si_base?(symbol) do
    symbol in [:s, :m, :kg, :A, :K, :mol, :cd]
  end

  @doc """
  Check if a unit is a base unit

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_base?(symbol) do
    is_si_base?(symbol)
  end

  @doc """
  Check if a unit is a derived unit

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_derived?(symbol) do
    not (is_si_base?(symbol))
  end

  @doc """
  Check if a unit is from the SI system

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_si?(symbol) do
    is_si_base?(symbol)
  end

  @doc """
  Check if a unit is from the imperial system

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_imp?(symbol) do
    not(is_si_base?(symbol))
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
    unit = si_base_make(symbol)
    unit.name
  end
end
