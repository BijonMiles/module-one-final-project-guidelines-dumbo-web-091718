class TransactionAccount < ActiveRecord::Base
  belongs_to :borrower_accounts
  belongs_to :lender_accounts

  # def transfer_money
  #
  #
  #   transaction_account
  # end

end
