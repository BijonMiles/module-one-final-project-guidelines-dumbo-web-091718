class TransactionAccount < ActiveRecord::Base
  belongs_to :borrower_accounts
  belongs_to :lender_accounts


  # def initialize(borrower_accounts, lender_accounts, payments_plan)
  #   @borrower_accounts = borrower_accounts
  #   @lender_accounts = lender_accounts
  #   @payments_plan =payments_plan
  #
  #
  # end
end
