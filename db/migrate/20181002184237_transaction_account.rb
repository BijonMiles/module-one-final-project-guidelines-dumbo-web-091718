class TransactionAccount < ActiveRecord::Migration[5.0]
  def change
    create_table :transaction_account do | t |
      t.integer :borrower_accounts_id
      t.integer :lender_accounts_id
    end
  end
end
