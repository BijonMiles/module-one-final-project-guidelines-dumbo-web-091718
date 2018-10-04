class AddColumnTransactionAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :transaction_accounts, :account_name, :string
    add_column :transaction_accounts, :transaction, :string
    add_column :transaction_accounts, :amount, :float
    add_column :transaction_accounts, :account_two, :string
  end
end
