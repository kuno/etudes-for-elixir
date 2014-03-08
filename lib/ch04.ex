defmodule ExEtudes.Ch04 do

  defp round(n) do
  end

  # Étude 4-1
  def etude41(shape, x, y) do
    case {shape, x, y} do
      {:rectangle, x, y} when x >= 0 and y >= 0 ->
        x * y
      {:triangle, x, y} when x >= 0 and y >= 0 ->
        (x * y) / 2
      {:ellipse, x, y} when x >= 0 and y >= 0 ->
        :math.pi() * x * y
    end
  end

  # Étude 4-2
  def etude42(m, n) when m == n, do: m
  def etude42(m, n) when m > n, do: etude42(m-n, n)
  def etude42(m, n) when m < n, do: etude42(m, n-m)

  # Étude 4-3
  def etude43(x, n) when n == 0, do: 1
  def etude43(x, n) when n == 1, do: x
  def etude43(x, n) when n > 0, do: :math.pow(x, n)
  def etude43(x, n) when n < 0, do: 1.0 * :math.pow(x, n)

  # Étude 4-4
  defp accumulator(x, n, acc) do
    IO.puts "Current accumulator is #{acc}"
    case n do
      0 -> acc
      _ -> accumulator(x, n-1, x * acc)
    end
  end
  def etude44(x, n) when n == 0, do: 1
  def etude44(x, n) when n == 1, do: x
  def etude44(x, n) when n > 0, do: accumulator(x, n, 1)
  def etude44(x, n) when n < 0, do: 1.0 * :math.pow(x, n * -1)

  # Étude 4-5
  defp helper(x, n, a) do
    f = :math.pow(a, n) - x
    f_prime = n * :math.pow(a, n - 1)
    next = a - (f / f_prime )
    change =  abs(next - a)
    IO.puts "Current change is #{change}"
    IO.puts "Current guess is #{next}"
    if change < 1.0e-8 and change > 0 do
      next
    else
      helper x, n, next
    end
  end

  def etude45(x, n) do
    helper x, n, x / 2.0
  end

end
