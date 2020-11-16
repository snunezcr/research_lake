defmodule RLUtils.Quantities.Units.UnknownUnitError do
  @moduledoc """
  Defines an error when encountering anunknown order of magnitude
  """
  defexception [:message]
end
