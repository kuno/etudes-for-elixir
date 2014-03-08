defmodule ExEtudes.Ch02 do
  # Étude 2-1
  def etude21(x, y) do
    x * y
  end

  # Étude 2-2
  def etude22(), do: 1
  def etude22(x), do: x
  def etude22(x, y), do: x * y

  # Étude 2-3
  @moduledoc """
  blah
  blah
  blah
  """
  @doc "blah"
  def area, do: nil

  # Étude 2-4
  def etude24(x \\ 3, y, z \\ 7) do
    x * y * z
  end
end
