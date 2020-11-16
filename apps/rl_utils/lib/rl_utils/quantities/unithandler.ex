defmodule RLUtils.Quantities.UnitHandler do
  @moduledoc """
  A top-level entity that takes care of all types of units
  """
  alias RLUtils.Quantities.Units.AbstractUnitHandler
  alias RLUtils.Quantities.Units.SIBaseUnits, as: SIBasic
  alias RLUtils.Quantities.Units.ImpBaseUnitHandler, as: ImpBasic
  alias RLUtils.Quantities.Units.UnitConverter, as: UConv
  alias RLUtils.Quantities.Units.UnknownUnitError

  @behaviour AbstractUnitHandler

  @doc """
  Check if a unit is a base unit

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_base?(symbol) do
    SIBasic.is_base?(symbol) || ImpBasic.is_base?(symbol)
  end

  @doc """
  Check if a unit is a derived unit

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_derived?(symbol) do
    SIBasic.is_derived?(symbol) || ImpBasic.is_derived?(symbol)
  end

  @doc """
  Check if a unit is from the SI system

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_si?(symbol) do
    SIBasic.is_si?(symbol) || ImpBasic.is_si?(symbol)
  end

  @doc """
  Check if a unit is from the imperial system

  * `:symbol`: a unit symbol
  """
  @impl AbstractUnitHandler
  def is_imp?(symbol) do
    SIBasic.is_imp?(symbol) || ImpBasic.is_imp?(symbol)
  end

  @doc """
  Check if an entity is a unit

  * `:symbol`: a unit
  """
  @impl AbstractUnitHandler
  def is_unit?(symbol) do
    SIBasic.is_unit?(symbol) || ImpBasic.is_unit?(symbol)
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
    cond do
      SIBasic.is_base?(symbol) -> SIBasic.name(symbol)
      ImpBasic.is_base?(symbol) -> ImpBasic.name(symbol)
      # TODO: complete for derived units
      true -> raise UnknownUnitError, "Unknown SI base unit encountered: #{inspect(symbol)}"
    end
  end

  @doc """
  Convert between two units

  * `:from`: symbol of unit to convert from
  * `:to`: symbol of unit to convert to
  """
  def convert(from, to) do
    UConv.convert(from, to)
  end
end
