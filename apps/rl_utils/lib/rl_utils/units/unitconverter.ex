defmodule RLUtils.Quantities.Units.UnitConverter do
  @moduledoc """
  A module that performs conversions between quantities.

  By convention, we always use the SI as our default ground truth. That is, any non-SI unit must be converted to an SI
  unit as a proxy. No SI units are converted into SI units.
  """
  alias RLUtils.Quantities.Units.UnknownUnitConversionError

  @conversion_table %{
    { :in, :m }   => 0.0254,
    { :ft, :m }  => 0.3048,
    { :yd, :m }  => 0.9144,
    { :mi, :m }  => 1609.344
  }

  defp find_proxy(a) do
    key = Enum.find(Map.keys(@conversion_table), fn {x, _} -> x == a end)
    cond do
      ({_, proxy} = key) != nil -> proxy
      true -> raise UnknownUnitConversionError, "Unknown unit conversion error encountered: #{inspect(a)}"
    end
  end

  defp connected?(a, b) do
    proxy = find_proxy(a)
    { b, proxy } in Map.keys(@conversion_table)
  end

  defp compute_factor(a, b) do
    proxy = find_proxy(a)
    @conversion_table[{a, proxy}] / @conversion_table[{b, proxy}]
  end

  @spec convert(any, any) :: {any, any}
  def convert(a, b) do
    cond do
      a == b -> { 1.0, b}
      @conversion_table[{a, b}] != nil -> {@conversion_table[{a, b}], b}
      @conversion_table[{b, a}] != nil -> {1.0/@conversion_table[{b, a}], b}
      connected?(a, b) -> { compute_factor(a,b), b}
      true -> raise UnknownUnitConversionError, "Unknown unit conversion error encountered: #{inspect(a)} -> #{inspect(b)}"
    end
  end
end
