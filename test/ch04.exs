defmodule ExEtudesTest.Ch04 do
  use ExUnit.Case
  import ExEtudes.Ch04

  test "solution to étude 4-1" do
    # try do
    #   etude41(:rectangle, -3, 4)
    #   etude41(:triangle, 3, -4)
    #   etude41(:ellipse, -3, -4)
    # rescue
    #   [CompileError] -> "expected"
    # end

    assert etude41(:rectangle, 3, 4) == 12
    assert etude41(:triangle, 3, 5) == 7.5
    assert etude41(:ellipse, 2, 4) == 25.132741228718345
  end

  test "solution to étude 4-2" do
    assert etude42(2, 8) == 2
    assert etude42(14, 21) == 7
    assert etude42(125, 46) == 1
    assert etude42(120, 36) == 12
  end

  test "solution to étude 4-3" do
    assert etude43(5, 1) == 5
    assert etude43(2, 3) == 8
    assert etude43(1.2, 3) == 1.7279999999999998
    assert etude43(2, 0) == 1
    assert etude43(2, -3) == 0.125
  end

  test "solution to étude 4-4" do
    assert etude44(2, 3) == 8
  end

  test "solution to étude 4-5" do
    assert etude45(27, 3) == 3.0
  end

end
