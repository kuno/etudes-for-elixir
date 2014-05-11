defmodule ExEtudesTest.Ch10 do
  use ExUnit.Case
  import ExEtudes.Ch10

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "solution to étude 10-1" do
    file = Path.join __DIR__, "../code/ch10-02/call_data.csv"
    data = etude101(file)
    assert is_map data
  end

  test "solution to étude 10-2" do
    file = Path.join __DIR__, "../code/ch10-02/call_data.csv"
    data = etude101(file)
    result = etude102(data)
    assert is_list result
  end

  test "solution to étude 10-2" do
    file = Path.join __DIR__, "../code/ch10-02/call_data.csv"
    data = etude101(file)
    result = etude102(data, "729-555-8855")
    assert length(result) == 1
  end

  test "solution to étude 10-2" do
    file = Path.join __DIR__, "../code/ch10-02/call_data.csv"
    data = etude101(file)
    result = etude102(data, "650-555-3326")
    assert length(result) == 3
  end

end
