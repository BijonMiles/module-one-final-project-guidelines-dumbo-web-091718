class ChangesTransactionAccountToTransactionAccounts < ActiveRecord::Migration[5.0]
  def change
    rename_table :transaction_account, :transaction_accounts
  end
end
