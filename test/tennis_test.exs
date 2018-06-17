import Tennis

defmodule TennisTest do
  use ExUnit.Case
  doctest Tennis

  @deuce "deuce"
  @advantage_one "Advantage player one"
  @advantage_two "Advantage player two"
  @winner_one "Player one wins!"
  @winner_two "Player two wins!"

  test "returns the corresponding call for the points tuple" do
    assert get_call_from_score(0, 0) == "love - love"
    assert get_call_from_score(1, 0) == "15 - love"
    assert get_call_from_score(2, 0) == "30 - love"
    assert get_call_from_score(3, 0) == "40 - love"
    assert get_call_from_score(1, 1) == "15 - 15"
    assert get_call_from_score(2, 2) == "30 - 30"
    assert get_call_from_score(3, 2) == "40 - 30"
    assert get_call_from_score(3, 3) == @deuce
    assert get_call_from_score(4, 4) == @deuce
    assert get_call_from_score(5, 5) == @deuce
    assert get_call_from_score(4, 3) == @advantage_one
    assert get_call_from_score(6, 5) == @advantage_one
    assert get_call_from_score(6, 7) == @advantage_two
    assert get_call_from_score(5, 3) == @winner_one
    assert get_call_from_score(7, 5) == @winner_one
    assert get_call_from_score(4, 0) == @winner_one
    assert get_call_from_score(0, 4) == @winner_two
    assert get_call_from_score(2, 4) == @winner_two
  end
end
