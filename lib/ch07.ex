defmodule ExEtudes.Ch07 do

  # Étude 7-1
  def etude71(f, x) do
    delta = 1.0e-10
    (f.(x + delta) - f.(x)) / delta
  end

  # Étude 7-2
  def etude72(people) do
    lc {name, gender, age} inlist people, age > 40 and gender == "M", do: name
  end

  # Étude 7-3
  def etude73mean(list) do
    Enum.reduce(list, fn(x, acc) -> x + acc end) / length(list)
  end
  def etude73stdv(list) do
    len = length(list)
    sum =  Enum.reduce(list, fn(x, acc) -> x + acc end)
    sum_sqrt = Enum.reduce(Enum.map(list, fn(x) -> x * x end), fn(x, acc) -> x + acc end)

    :math.sqrt((len * sum_sqrt - sum * sum)/(len * (len - 1)))
  end

  # Étude 7-5
  def etude75(list1, list2) do
    lc x inlist list1, y inlist list2, do: {x, y}
  end

  # Étude 7-6
  @doc """
  Entry clause
  """
  def etude76shuffle(list) do
    :random.seed(:erlang.now())
    etude76shuffle(list, [])
  end

  @doc """
  Return caluse
  """
  def etude76shuffle([], acc) do
    acc
  end

  @doc """
  Actually computation clause
  Pick up a random integer n, between 0 and the length of candidate list
  Use this integer to split candidate list to 3 part,
  put the middle part to accumulator list, and the head and tail form a new candidate list,
  Then enter the next round computation until there are nothing left in the candidate list.
  Return the accumulator list
  """
  def etude76shuffle(list, acc) do
    IO.inspect list
    IO.inspect acc
    {leading, [h | t]} =
    Enum.split(list, :random.uniform(Enum.count(list)) - 1)
    etude76shuffle(leading ++ t, [h | acc])
  end

end
