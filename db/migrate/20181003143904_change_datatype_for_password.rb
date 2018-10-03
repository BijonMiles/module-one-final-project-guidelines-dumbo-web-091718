class ChangeDatatypeForPassword < ActiveRecord::Migration[5.0]
  def change
    change_column :lender_accounts, :password, :string
  end
end
