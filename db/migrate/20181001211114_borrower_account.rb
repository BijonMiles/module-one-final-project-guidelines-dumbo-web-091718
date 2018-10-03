class BorrowerAccount < ActiveRecord::Migration[5.0]
  def change
    create_table :borrower_accounts do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.float :balance
      t.string :status
      t.string :address
      t.integer :password
    end
  end
end
