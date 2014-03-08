defmodule ExetudesTest.Ch03 do
  use ExUnit.Case
  import Exetudes.Ch03

  test "solution to étude 3-1" do
    assert etude31(:rectangle, 3, 4) == 12
    assert etude31(:triangle, 3, 5) == 7.5
    assert etude31(:ellipse, 2, 4) == 25.132741228718345
  end

  test "solution to étude 3-2" do
    try do
      etude32(:rectangle, -3, 4)
      etude32(:triangle, 3, -4)
      etude32(:ellipse, -3, -4)
    rescue
      [CompileError] -> "expected"
    end

    assert etude32(:rectangle, 3, 4) == 12
    assert etude32(:triangle, 3, 5) == 7.5
    assert etude32(:ellipse, 2, 4) == 25.132741228718345
  end

  test "solution to étude 3-3" do
    assert etude33(:rectangle, 3, 4) == 12
    assert etude33(:pentagon, 3, 4) == 0
    assert etude33(:ellipse, -1, 5) == 0
    assert etude33(:triangle, 5, -1) == 0
  end

  test "solution to étude 3-4" do
    try do
     etude34(:triangle, 7, 3)
    rescue
      [UndefinedFunctionError] -> "rescued"
    end
    assert etude34({:rectangle, 7, 3}) == 21
    assert etude34({:triangle, 7, 3}) == 10.5
    assert etude34({:ellipse, 7, 3}) == 65.97344572538566
    assert etude34({:pentagon, 7, 3}) == 0
  end

end
