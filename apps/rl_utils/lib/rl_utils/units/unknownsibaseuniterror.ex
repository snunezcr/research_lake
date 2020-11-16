defmodule RLUtils.Quantities.Units.UnknownImpBaseUnitError do
  @moduledoc """
  Defines an error when encountering anunknown order of magnitude
  """
  defexception [:message]
end
