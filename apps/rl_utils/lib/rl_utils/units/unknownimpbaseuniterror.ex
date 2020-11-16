defmodule RLUtils.Quantities.Units.UnknownSIBaseUnitError do
  @moduledoc """
  Defines an error when encountering anunknown order of magnitude
  """
  defexception [:message]
end
