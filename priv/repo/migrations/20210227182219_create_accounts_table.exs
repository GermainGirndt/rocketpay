defmodule Rocketpay.Repo.Migrations.CreateAccountsTable do
  use Ecto.Migration

  def change do
    create table :accounts do
      # do not use float! :decimal is specific for monetary values
      add :balance, :decimal
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end

    #constraints extends funcitionallity from data
    # it creates proctections
    create  constraint(:accounts, :balance_must_be_positive_or_zero, check: "balance >= 0")
  end
end
