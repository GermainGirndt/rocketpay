# defmodule MODULE.MODULE_NAME
defmodule Rocketpay.Numbers do

  def sum_from_file(filename) do
    # string interpolation with #{}
    # string always with "
    # on terminal - interative elixir:
    # iex -S mix (iex)
    # Rocketpay.Numbers.sum_from_file("numbers")
    file= File.read("#{filename}.csv")
  end

end
