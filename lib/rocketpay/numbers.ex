# defmodule MODULE.MODULE_NAME
defmodule Rocketpay.Numbers do

  def sum_from_file(filename) do
    # string interpolation with #{}
    # string always with "
    # on terminal - interative elixir:
    # iex -S mix (iex)
    # Rocketpay.Numbers.sum_from_file("numbers")
    # file= File.read("#{filename}.csv")

    # = is also match operator (for polinomic operators)
    # [a, b, c, d] = [1, 2, 3, 4]
    # but ERROR: [a, b] = [1, 2, 3, 4]
    file = File.read("#{filename}.csv")
    handle_file(file)
  end

  #defp = defining private functions
  defp handle_file({:ok, file}), do: file
  defp handle_file({:error, _reason}), do: {:error, "Invalid file!"}

end
