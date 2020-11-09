defmodule RLUtils.Quantities.BaseUnit do
  @moduledoc """
  A module that represents base units in the International Systems of Units.
  """

  @typedoc """
  A type for the symbol of base units.
  """
  @type si_symb :: :nounit | :s | :m | :kg | :A | :K | :mol | :cd

  defstruct symbol: :nounit,
            name: "no unit",
            quantity: "no quantity"

  @typedoc """
  A type for the Base unit

  * `:symbol`: the symbol of the unit
  * `:name`: the name of the unit
  * `:quantity`: the quantity measured by the unit
  """
  @type t :: %__MODULE__{
                          symbol: si_symb(),
                          name: String.t(),
                          quantity: String.t()
                        }
end
