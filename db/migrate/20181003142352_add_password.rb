class AddPassword < ActiveRecord::Migration[5.0]
  def change
    add_column :borrower_accounts, :password, :string
  end
end
