defmodule RLUtils.Quantities.OrdMagnitude do
  @moduledoc """
  The definition of orders of magnitude as powers of ten. We distinguish between the factor and exponent as a way
  to be computationally efficient and simultaneonsly provide symbolic information.
  """

  @typedoc """
  A type for symbols associated with order of magnitude
  """
  @type om_symbol ::  :Y | :Z | :E | :P | :T | :G | :M | :k | :h | :da | :id |
                    :d | :c | :m | :u | :n | :p | :f | :a | :z | :y

  defstruct symbol: :pure,
            name: "",
            factor: 1.0e0,
            exponent: 0

  @typedoc """
  A type for order of magnitude specifications

  * `:symbol`: symbol used to denote the factor
  * `:name`: name of the factor
  * `:factor`: quantity of the factor
  """
  @type t :: %__MODULE__{
                          symbol: om_symbol(),
                          name: String.t(),
                          factor: float(),
                          exponent: integer()
                        }
end
