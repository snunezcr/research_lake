defmodule RLUtils.Quantities.Constant do
  @moduledoc """
  The definition of a constant in SI units.
  """
  alias RLUtils.Quantities.BasicUnit
  alias RLUtils.Quantities.DerivedUnit

  @typedoc """
  Type of a SI symbol, for which we use the ones from derived or basic units
  """
  @type unit :: nil | BaseUnit.t() | DerivedUnit.t()

  defstruct units: nil,
            name: "none",
            exact_value: 0.0

  @typedoc """
  A type for a constant quantity

  * `:units`: the units of the constant
  * `:name` the name of the constant
  * `:exact_value`: the experimentally observed value of the constant
  """
  @type t :: %__MODULE__{
                          symbol: unit(),
                          name: String.t(),
                          exact_value: float()
                        }
end
