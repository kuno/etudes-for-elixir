defmodule ExEtudesTest.Ch07 do
  use ExUnit.Case
  import ExEtudes.Ch07

  test "solution to étude 7-1" do
    f1 = fn(x) -> x * x end
    assert f1.(7) == 49
    assert etude71(f1, 3) == 6.00000049644222599454
    assert etude71(fn(x) -> 3 * x * x + 2 * x + 1 end, 5) == 32.00000264769187197089
    assert etude71(&:math.sin/1, 0) == 1.0
  end

  test "solution to étude 7-2" do
    people = [{"Federico", "M", 22}, {"Kim", "F", 45},
      {"Hansa", "F", 30}, {"Tran", "M", 47},
      {"Cathy", "F", 32}, {"Elias", "M", 50}]
    assert etude72(people) == ["Tran", "Elias"]
  end

  test "solution to étude 7-3" do
    assert etude73mean([7, 2, 9]) == 6.0
    assert etude73stdv([7, 2, 9]) == 3.60555127546398912486
  end

  test "solution to étude 7-5" do
    list1 = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
    list2 = ["Clubs", "Diamonds", "Hearts", "Spades"]

    assert length(etude75(list1, list2)) == length(list1) * length(list2)
  end

end
