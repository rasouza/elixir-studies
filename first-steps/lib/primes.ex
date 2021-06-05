defmodule Primes do
  @moduledoc """
  Documentation for `Primes`.
  """
  def n(n), do: prime(n, 2)

  defp prime(n, n), do: []

  defp prime(n, i) do
    case is_prime(i) do
      true -> [i | prime(n, i + 1)]
      false -> prime(n, i + 1)
    end
  end

  defp is_prime(n) do
    divisors = 2..n
    |> Enum.filter(&(rem(n, &1) == 0))

    length(divisors) == 1
  end
end
