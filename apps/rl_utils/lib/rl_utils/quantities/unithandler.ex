defprotocol RLUtils.Quantities.UnitPolicy do
  @moduledoc """
  A protocol to describe common operations with units.
  """

  @doc """
  Convert a unit to string
  """
  def to_string(unit)

  @doc """
  Convert a unit to a LaTeX processing string
  """
  def to_latex(unit)

  @doc """
  Determine if the unit is in normal form (i.e. not reducible)
  """
  def is_normal(unit)

  @doc """
  Create a composite of units from a list
  """
  def composite(numerator, denominator)

  @doc """
  Convert to another unit type
  """
  def convert(to_unit_symb)
end
