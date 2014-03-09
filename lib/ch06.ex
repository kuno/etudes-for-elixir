defmodule ExEtudes.Ch06 do

  # Étude 6-1
  defp minimum(h, t) do
    [nh|nt] = t
    candidate = min(h, nh)
    if length(nt) == 0 do
      candidate
    else
      minimum(candidate, nt)
    end
  end
  defp maximum(h, t) do
    [nh|nt] = t
    candidate = max(h, nh)
    if length(nt) == 0 do
      candidate
    else
      maximum(candidate, nt)
    end
  end

  def etude61min(list) do
    [head|tail] = list
    minimum(head, tail)
  end

  def etude61max(list) do
    [head|tail] = list
    maximum(head, tail)
  end

  def etude61range(list) do
    [head|tail] = list
    [minimum(head, tail), maximum(head, tail)] 
  end

  # Étude 6-2
  defp ruannian?(yyyy) do
    rem(yyyy, 4) == 0
  end

  defp sum_days(month, days) do
    case Enum.split(days, month) do
      {[], _left} -> m = [0]
      {l, _left} -> m = l
    end

    Enum.reduce m, fn(x, acc) -> x + acc end
  end

  defp sum_normal_days(month, day) do
    days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    sum_days(month - 1, days) + day
  end

  defp sum_ruannian_days(month, day) do
    days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    sum_days(month - 1, days) + day
  end
  defp sum(h, t) do
    [nh|nt] = t
    candidate = h + nh
    if length(nt) == 0 do
      candidate
    else
      sum(candidate, nt)
    end
  end
  def etude62(date) do
    import ExEtudes.Ch05
    [year, month, day] = etude53(date)

    if ruannian?(year) do
      sum_ruannian_days(month, day)
    else
      sum_normal_days(month, day)
    end
  end

  # Étude 6-3
  defp need_attention?([0]), do: false
  defp need_attention?(list) do
    not Enum.empty?(Enum.filter(list, fn(x) -> x >= 4 end))
  end
  defp loop(n, result, list) do
    if n > length(list) do
      Enum.sort(result)
    else
      i = n - 1
      m = need_attention?(Enum.at(list, i))
      case  m do
        true -> loop(n + 1, [n | result], list)
        false -> loop(n + 1, result, list)
      end
    end
  end
  def etude63(list), do: loop(1, [], list)

  # Étude 6-4
  defp build_one_teeth(n, result) do
    if n > 6 do
      result
    else
      build_one_teeth(n + 1, [:random.uniform(4)|result])
    end
  end
  defp build_teeth(m, result) do
    if m > 32 do
      result
    else
      build_teeth(m + 1, [build_one_teeth(1, [])|result])
    end
  end
  def etude64 do
    build_teeth(1, [])
  end

  # Étude 6-5
  defp readline(map, device) do
    result =  IO.read(device, :line)

    if result == :eof do
      map
    else
      [key, a, b] = String.split(result, ",")
      IO.puts key
      map = Map.put(map, key, a <> " " <> b)
      IO.inspect map
      readline(map, device)
    end
  end
  def etude65(path) do
    map = Map.new
    case File.open(path, [:read, :utf8]) do
      {:ok, device } -> readline(map, device)
      _ -> nil
    end
  end

end
