class ChangeTransactionColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :transaction_accounts, :transaction, :details
  end
end
