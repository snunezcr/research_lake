defmodule RLUtils.Quantities.Units.UnknownUnitConversionError do
  @moduledoc """
  Defines an error when encountering anunknown order of magnitude
  """
  defexception [:message]
end
