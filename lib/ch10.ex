defmodule ExEtudes.Ch10 do

  defp to_i (s) do
    {n, _} = :string.to_integer(to_char_list(s))
    n
  end

  defp to_date_tuple(raw) do
    clean = String.strip raw
    list = String.split(clean, "-")

    year = Enum.at list, 0
    month = Enum.at list, 1
    day = Enum.at list, 2

    {to_i(year), to_i(month), to_i(day)}
  end

  defp to_time_tuple(raw) do
    clean = String.strip raw
    list = String.split(clean, ":")

    hour = Enum.at list, 0
    minute = Enum.at list, 1
    second = Enum.at list, 2

    {to_i(hour), to_i(minute), to_i(second)}
  end

  defp readline(map, device) do
    result =  IO.read(device, :line)

    if result == :eof do
      map
    else
      [phone_number, starting_date, starting_time, end_date, end_time] = String.split(result, ",")
      starting_date_tuple = to_date_tuple(starting_date)
      starting_time_tuple = to_time_tuple(starting_time)
      end_date_tuple = to_date_tuple(end_date)
      end_time_tuple = to_time_tuple(end_time)

      starting_end_tuple = [{{starting_date_tuple, starting_time_tuple},{end_date_tuple, end_time_tuple}}]
        case Dict.has_key? map, phone_number do
          false -> map = Dict.put(map, phone_number, starting_end_tuple)
          true ->
            old = Dict.get(map, phone_number)
            new = starting_end_tuple ++ old
            map = Dict.put(map, phone_number, new)
          end

      readline(map, device)
    end
  end

  defp conculate(list) do
    Enum.map(list, fn (t) -> {start_tuple, end_tuple} = t; :calendar.datetime_to_gregorian_seconds(end_tuple) - :calendar.datetime_to_gregorian_seconds(start_tuple) end)
    |> Enum.sum
  end

  def etude101(path) do
    map = Map.new
    case File.open(path, [:read, :utf8]) do
      {:ok, device} -> readline(map, device)
      _ -> nil
    end
  end

  def etude102(data) do
    Enum.map(data, fn {k, list} ->  seconds = conculate(list); {k, seconds} end  )
  end

  def etude102(data, key) do
    case Dict.get(data, key) do
      nil -> nil
      _ -> [{key, conculate(Dict.get(data, key))}]
    end
  end
end
