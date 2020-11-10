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

  @typedoc """
  A type for the order of magnitude of a quantity
  """
  @type omag :: OrdMagnitude.om_symbol()

  defstruct value: 0.0,
            units: nil,
            orderm: :id

  @typedoc """
  A type for a Quantity

  * `:value`: the value to be represented
  * `:units`: units that the value represents
  * `:orderm`: order of magnitude of this representation
  """
  @type t :: %__MODULE__{
                          value: float(),
                          units: unit(),
                          orderm: omag()
                        }

end
