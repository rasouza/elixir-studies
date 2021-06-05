defmodule Primes do
  @moduledoc """
  Documentation for `Primes`.
  """

  def n(n), do: find_next(3, n, [2])

  def find_next(_, limit, primes) when length(primes) == limit, do: primes

  def find_next(n, limit, primes) do
    case is_prime(n) do
      true -> find_next(n + 2, limit, [n | primes])
      false -> find_next(n + 2, limit, primes)
    end
  end

  def is_prime(n) do
    divides = fn(b) -> rem(n, b) == 0 end
    divisors = 1..(n |> :math.sqrt |> floor)
    |> Enum.filter(divides)

    divisors == [1]
  end
end

defmodule Prime do
  def nth(n) do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.filter(&prime?(&1))
    |> Stream.with_index(1)
    |> Enum.find(fn {_prime, x} -> x == n end)
  end

  def prime?(1), do: false
  def prime?(2), do: true
  def prime?(3), do: true
  def prime?(5), do: true
  def prime?(7), do: true
  def prime?(n) when rem(n, 2) == 0, do: false
  def prime?(n) do
    limit = [7, round(:math.sqrt(n))] |> Enum.max

    Stream.iterate(3, &(&1 + 2))
    |> Stream.take_while(fn x -> x <= limit end)
    |> Stream.filter(fn x -> rem(n,x) == 0 end)
    |> Enum.empty?
  end
end


IO.inspect Prime.nth(100000)
