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
    # file = File.read("#{filename}.csv")
    # handle_file(file)


    # applying pipe: pass the return value from the previous line as function parameter (FIRST ARGUMENT)
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  #defp = defining private functions
  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end) #stream is a lazy operator; it optimizes the performance to reduce iterations/method calls
      # |> IO.inspect() # log on terminal by method call
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}

end
