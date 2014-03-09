defmodule ExEtudes.Ch05 do

  # Étude 5-3
  def etude53(date) do
    Enum.map(
      String.split(date, "-"),
      fn(x) -> elem(Integer.parse(x), 0) end
    )
  end
end
