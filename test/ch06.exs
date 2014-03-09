defmodule ExEtudesTest.Ch06 do
  use ExUnit.Case
  import ExEtudes.Ch06

  defp pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
      [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
      [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
      [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
      [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
      [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
      [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
      [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
      [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
      [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
      [3,2,3,2,3,2]]
  end

  test "solution to étude 6-1" do
    data = [4, 1, 7, -17, 8, 2, 5]
    assert etude61min(data) == -17
    assert etude61min([52, 46]) == 46
    assert etude61max(data) == 8
    assert etude61range(data) ==  [-17,8]
  end

  test "solution to étude 6-2" do
    assert etude62("2013-12-31") == 365
    assert etude62("2012-12-31") == 366
    assert etude62("2012-02-05") == 36
    assert etude62("2013-02-05") == 36
    assert etude62("1900-03-01") == 61
    assert etude62("2000-03-01") == 61
    assert etude62("2013-01-01") == 1
  end

  test "solution to étude 6-3" do
    assert etude63(pocket_depths) == [9,11,25,26,29]
  end

  test "solution to étude 6-4" do
    result = etude64()
    assert length(result) == 32
  end
  
  test "solution to étude 6-5" do
    file = Path.join __DIR__, "../code/ch06-05/courses.csv"
    assert is_map(etude65(file))
  end

end
