defmodule RLUtils.Quantities.Quantity do
  @moduledoc """
  The representation of a quantity that may or may not have units (i.e. dimensional vs adimensional)
  """
  alias RLUtils.Quantities.BaseUnit
  alias RLUtils.Quantities.DerivedUnit
  alias RLUtils.Quantities.OrdMagnitude

  @typedoc """
  A type for the unit of a quantity
  """
  @type unit :: nil | BaseUnit.t() | DerivedUnit.t()
  @type omag :: OrdMagnitude.om_symbol()

  defstruct value: 0.0,
            units: nil,
            orderm: :pure
end
