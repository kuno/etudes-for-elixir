defmodule ExetudesTest.Ch02 do
  use ExUnit.Case
  import Exetudes.Ch02

  test "solution to étude 2-1" do
    assert etude21(3, 4) == 12
    assert etude21(12, 7) == 84
  end

  test "solution to étude 2-2" do
    assert etude22(5, 7) == 35
    assert etude22(7) == 7
    assert etude22() == 1
  end

  test "solution to étude 2-3" do
    assert true
    #assert Module.get_attribute(Exetudes.Ch02, :moduledoc)
    #assert Exetudes.Ch02.area.doc
  end

  test "solution to étude 2-4" do
    assert etude24(11, 22, 33) == 11 * 22 * 33
    assert etude24(11, 22) == 11 * 22 * 7
    assert etude24(11) == 3 * 11 * 7
  end
end
