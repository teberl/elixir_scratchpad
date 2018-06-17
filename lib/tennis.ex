defmodule Tennis do
  @moduledoc """
  Score keeping for a tennis match.
  """

  @deuce "deuce"
  @advantage_one "Advantage player one"
  @advantage_two "Advantage player two"
  @winner_one "Player one wins!"
  @winner_two "Player two wins!"

  @doc """
  Returns the corresponding call from the given score.

  Returns String.t.

  ## Examples

      iex> Tennis.get_call_from_score(0, 0)
      "love - love"

  """
  @spec get_call_from_score(integer, integer) :: String.t()
  def get_call_from_score(player_one, player_two) do
    case {player_one, player_two} do
      {0, 0} ->
        concat_call(player_one, player_two)

      {3, 3} ->
        @deuce

      {_, _} when player_one < 4 and player_two < 4 ->
        concat_call(player_one, player_two)

      {_, _} ->
        get_call(player_one, player_two)
    end
  end

  @spec concat_call(integer, integer) :: String.t()
  defp concat_call(one, two) do
    points_to_calls = ["love", "15", "30", "40"]
    Enum.at(points_to_calls, one) <> " - " <> Enum.at(points_to_calls, two)
  end

  @spec get_call(integer, integer) :: String.t()
  defp get_call(player_one, player_two) do
    diff = player_one - player_two

    cond do
      diff == 1 ->
        @advantage_one

      diff == -1 ->
        @advantage_two

      diff > 1 ->
        @winner_one

      diff < -1 ->
        @winner_two

      true ->
        @deuce
    end
  end
end
