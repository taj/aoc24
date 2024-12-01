defmodule Day1 do
  def part_1 do
    {lefts, rights} = input()

    Enum.zip(Enum.sort(lefts), Enum.sort(rights))
    |> Enum.reduce(0, fn {left, right}, acc ->
      Kernel.abs(left - right) + acc
    end)
  end

  def part_2 do
    {lefts, rights} = input()

    Enum.reduce(lefts, 0, fn left, acc ->
      frequency =
        Enum.frequencies_by(rights, fn right -> left == right end)
        |> Map.get(true, 0)

      frequency * left + acc
    end)
  end

  defp input do
    "lib/inputs/day_1.txt"
    |> File.read!()
    |> String.split("\n")
    |> Enum.reduce({[], []}, fn x, {left_acc, right_acc} ->
      [left, right] = String.split(x)
      {left_acc ++ [String.to_integer(left)], right_acc ++ [String.to_integer(right)]}
    end)
  end
end
