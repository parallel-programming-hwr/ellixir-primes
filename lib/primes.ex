defmodule Primes do
  def start(_type, _args) do
    Enum.each(0..6, fn (n) -> Task.start(fn -> primes(2*n + 1, 16) end); end)

    primes(15, 16)
  end

  defp primes(value, step) do
    if rem(value, 2) != 0 && check_prime(value, 3) do
      IO.puts(value)
    end
    primes(value + step, step)
  end

  defp check_prime(value, num) do
    cond do
      num > :math.sqrt(value) -> true
      rem(value, num) != 0 -> check_prime(value, num + 2)
      true -> false
    end
  end
end
