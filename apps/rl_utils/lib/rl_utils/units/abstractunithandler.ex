defmodule RLUtils.Quantities.Units.AbstractUnitHandler do
  @moduledoc """
  A behaviour to describe common operations with units.
  """

  @callback is_base?(atom()) :: boolean()
  @callback is_derived?(atom()) :: boolean()
  @callback is_si?(atom()) :: boolean()
  @callback is_imp?(atom()) :: boolean()
  @callback is_unit?(atom()) :: boolean()
  @callback symb(atom()) :: String.t()
  @callback name(atom()) :: String.t()
end
