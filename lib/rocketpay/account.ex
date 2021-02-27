defmodule Rocketpay.Account do

  use Ecto.Schema
  import Ecto.Changeset

  alias Rocketpay.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User
    timestamps()
  end


  def changeset(struct \\ %__MODULE__{}, params) do
      struct
      |> cast(params, @required_params)
      |> validate_required(@required_params)
      |> check_constraint(:balance, name: :balance_must_be_positive_or_zero)
  end
end
# Rocketpay.Repo.all(Rocketpay.User)
# params = %{user_id: "32ac2a86-0f0c-4052-a579-c8ed10475f27", balance: "0.00"}
# params |> Rocketpay.Account.changeset() |> Rocketpay.Repo.insert()
# Rocketpay.Repo.all(Rocketpay.User) |> Rocketpay.Repo.preload(:account)
