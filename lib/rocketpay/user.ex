defmodule Rocketpay.User do

  # schema = maps data to the table (its similar to the models in the MVC paradigm)
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  #binary_id = uuid
  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :age, :email, :password, :nickname]

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :password, :string, virtual: true #virtual = not present in DB
    field :password_hash, :string
    field :nickname, :string

    timestamps()
  end


  # maps data to the DB table
  # casts data to the data type required by the table
  # validates data
  def changeset(params) do
    % __MODULE__{} # struct with the module name
      |> cast(params, @required_params)
      |> validate_required(@required_params)
      |> validate_length(:password_hash, min: 6)
      |> validate_number(:age, greater_than_or_equal_to: 18)
      |> validate_format(:email, ~r/@/)
      |> unique_constraint([:email])
      |> unique_constraint([:nickname])
      |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password} = changeset}) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset

end
