defmodule RLUtils.Quantities.Units.BaseUnit do
  @moduledoc """
  A module that represents base units across any system of units.
  """

  @typedoc """
  A type for the system of units.
  """
  @type siu :: :si | :nsicmp | :cgs | :imp

  defstruct symbol: :nounit,
            name: "no unit",
            quantity: "no quantity",
            system: :si

  @typedoc """
  A type for the Base unit

  * `:symbol`: the symbol of the unit
  * `:name`: the name of the unit
  * `:quantity`: the quantity measured by the unit
  * `:system`: the system of unit to which this unit belongs
  """
  @type t :: %__MODULE__{
                          symbol: atom(),
                          name: String.t(),
                          quantity: String.t(),
                          system: siu()
                        }
end
