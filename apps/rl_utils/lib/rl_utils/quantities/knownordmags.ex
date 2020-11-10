defmodule RLUtils.Quantities.KnownOrdMags do
  @moduledoc """
  A collection of known orders of magnitude including their multipliers.

  Users only interact with the library through atoms, not the functions that create
  the orders of magnitude.
  """
  alias RLUtils.Quantities.OrdMagnitude
  alias RLUtils.Quantities.UnknownOrdMagError

  defp largest() do
    24
  end

  defp yotta() do
    %OrdMagnitude{ symbol: :Y, name: "Yotta", factor: 1.0e24, exponent: 24}
  end

  defp zetta() do
    %OrdMagnitude{ symbol: :Z, name: "Zetta", factor: 1.0e21, exponent: 21}
  end

  defp exa() do
    %OrdMagnitude{ symbol: :E, name: "Exa", factor: 1.0e18, exponent: 18}
  end

  defp peta() do
    %OrdMagnitude{ symbol: :P, name: "Peta", factor: 1.0e15, exponent: 15}
  end

  defp tera() do
    %OrdMagnitude{ symbol: :T, name: "Tera", factor: 1.0e12, exponent: 12}
  end

  defp giga() do
    %OrdMagnitude{ symbol: :G, name: "Giga", factor: 1.0e9, exponent: 9}
  end

  defp mega() do
    %OrdMagnitude{ symbol: :M, name: "Mega", factor: 1.0e6, exponent: 6}
  end

  defp kilo() do
    %OrdMagnitude{ symbol: :k, name: "kilo", factor: 1.0e3, exponent: 3}
  end

  defp id() do
    %OrdMagnitude{ symbol: :id, name: "", factor: 1.0e0, exponent: 0}
  end

  defp centi() do
    %OrdMagnitude{ symbol: :c, name: "centi", factor: 1.0e-2, exponent: -2}
  end

  defp milli() do
    %OrdMagnitude{ symbol: :m, name: "milli", factor: 1.0e-3, exponent: -3}
  end

  defp micro() do
    %OrdMagnitude{ symbol: :u, name: "micro", factor: 1.0e-6, exponent: -6}
  end

  defp nano() do
    %OrdMagnitude{ symbol: :n, name: "nano", factor: 1.0e-9, exponent: -9}
  end

  defp pico() do
    %OrdMagnitude{ symbol: :p, name: "pico", factor: 1.0e-12, exponent: -12}
  end

  defp femto() do
    %OrdMagnitude{ symbol: :f, name: "femto", factor: 1.0e-15, exponent: -15}
  end

  defp atto() do
    %OrdMagnitude{ symbol: :a, name: "atto", factor: 1.0e-18, exponent: -18}
  end

  defp zepto() do
    %OrdMagnitude{ symbol: :z, name: "zepto", factor: 1.0e-21, exponent: -21}
  end

  defp yocto() do
    %OrdMagnitude{ symbol: :y, name: "yocto", factor: 1.0e-24, exponent: -24}
  end

  defp smallest() do
    -24
  end

  defp omlist() do
    [:Y, :Z, :E, :P, :T, :G, :M, :k, :h, :da, :id, :d, :c, :m, :u, :n, :p, :f, :a, :z, :y]
  end

  @spec fit(integer()) :: OrdMagnitude.t()
  defp fit(exponent) do
    case exponent do
      24 -> yotta()
      21 -> zetta()
      18 -> exa()
      15 -> peta()
      12 -> tera()
      9 -> giga()
      6 -> mega()
      3 -> kilo()
      0 -> id()
      -2 -> centi()
      -3 -> milli()
      -6 -> micro()
      -9 -> nano()
      -12 -> pico()
      -15 -> femto()
      -18 -> atto()
      -21 -> zepto()
      -24 -> yocto()
      _ -> raise UnknownOrdMagError, "Unknown order of magnitude value encountered: #{inspect(exponent)}"
    end
  end

  @doc """
  Obtains the order of magnitude from a symbol for computation

  * `:symbol`: the symbol that specifies the order of magnitude
  """
  @spec omag(atom()) :: OrdMagnitude.t()
  def omag(symbol) do
    case symbol do
      :Y -> yotta()
      :Z -> zetta()
      :E -> exa()
      :P -> peta()
      :T -> tera()
      :G -> giga()
      :M -> mega()
      :k -> kilo()
      :id -> id()
      :c -> centi()
      :m -> milli()
      :u -> micro()
      :n -> nano()
      :p -> pico()
      :f -> femto()
      :atto -> atto()
      :z -> zepto()
      :y -> yocto()
      _ -> raise UnknownOrdMagError, "Unknown order of magnitude encountered: #{inspect(symbol)}"
    end
  end

  @doc """
  Check if a symbol specification exists

  * `:symbol`: the symbol that specifies the order of magnitude
  """
  @spec exists?(atom()) :: boolean()
  def exists?(symbol) do
    symbol in omlist()
  end

  @doc """
  Provide the colloquial name for a given symbol

  * `:symbol`: the symbol that specifies the order of magnitude
  """
  def name(symbol) do
    %OrdMagnitude{name: nm} = omag(symbol)
    nm
  end

  @doc """
  A function that converts between orders of magnitude

  * `:source`: an order of magnitude to convert from
  * `:tsymbol`: the target symbol to convert to
  """
  @spec convert(atom(), atom()) :: { float(), atom()}
  def convert(ssymbol, tsymbol) do
    unless exists?(ssymbol) do
      raise UnknownOrdMagError, "Unknown order of magnitude encountered in source: #{inspect(tsymbol)}"
    end

    unless exists?(tsymbol) do
      raise UnknownOrdMagError, "Unknown order of magnitude encountered in target: #{inspect(tsymbol)}"
    end

    source = omag(ssymbol)
    target = omag(tsymbol)
    { source.factor/target.factor, tsymbol }
  end

  @doc """
  Represents a quantity depending on its nominal value

  * `:value`: a real value to represent in the system
  """
  @spec represent(float()) :: { float(), atom() }
  def represent(value) do
    exponent = floor(:math.log10(value))

    exp = cond do
        exponent > largest() -> largest()
        exponent < smallest() -> smallest()
        true -> exponent
    end

    extra = rem(exp, 3)
    base = exp - extra
    %OrdMagnitude{symbol: s} = fit(base)
    rebased = (value/:math.pow(10, base))

    {rebased, s}
  end

  @doc """
  Normalize an order of magnitude with respect to a value

  * `:value`: a real value to represent in the system
  * `:symbol`: the symbol that specifies the order of magnitude
  """
  @spec normalize(atom(), float()) :: { float(), atom()}
  def normalize(symbol, value) do
    represent(:math.pow(10, omag(symbol).exponent) * value)
  end
end
