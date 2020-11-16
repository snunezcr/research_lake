defmodule RLUtils.Quantities.Units.DerivedUnit do
  @moduledoc """
  A module that represents derived units in the International Systems of Units.
  """

  @typedoc """
  A type for the symbol of derived units.
  """
  @type symb :: atom()

  defstruct symbol: :nounit,
            name: "no unit",
            quantity: "no quantity",
            numerator: [],
            denominator: []

  @typedoc """
  A type for the Derived unit

  * `:symbol`: the symbol of the unit
  * `:name`: the name of the unit
  * `:quantity`: the quantity measured by the unit
  * `:numerator`: the units that appear in the numerator
  * `:denominator`: the units that appear in the denominator
  """
  @type t :: %__MODULE__{
                          symbol: symb(),
                          name: String.t(),
                          quantity: String.t(),
                          numerator: list(),
                          denominator: list()
                        }
end
