defmodule Exetudes.Ch03 do

  # Étude 3-1
  def etude31(:rectangle, x, y), do: x * y
  def etude31(:triangle, x, y), do: (x * y) / 2
  def etude31(:ellipse, x, y), do: :math.pi() * x * y

  # Étude 3-2
  def etude32(:rectangle, x, y) when x >= 0 and y >= 0, do: x * y
  def etude32(:triangle, x, y) when x >= 0 and y >= 0, do: (x * y) / 2
  def etude32(:ellipse, x, y) when x >= 0 and y >= 0,  do: :math.pi() * x * y

  # Étude 3-3
  def etude33(shape, x, y) when not shape in [:rectangle, :triangle, :ellipse], do: 0
  def etude33(shape, x, y) when x < 0 or y < 0, do: 0
  def etude33(shape, x, y) when shape == :rectangle, do: x * y
  def etude33(shape, x, y) when shape == :triangle, do: (x * y) / 2
  def etude33(shape, x, y) when shape == :ellipse,  do: :math.pi() * x * y 

  # Étude 3-4
  def etude34({shape, x, y}) when not shape in [:rectangle, :triangle, :ellipse], do: 0
  def etude34({shape, x, y}) when x < 0 or y < 0, do: 0
  def etude34({shape, x, y}) when shape == :rectangle, do: x * y
  def etude34({shape, x, y}) when shape == :triangle, do: (x * y) / 2
  def etude34({shape, x, y}) when shape == :ellipse,  do: :math.pi() * x * y 

end
