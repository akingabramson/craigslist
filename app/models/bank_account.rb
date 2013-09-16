class BankAccount < ActiveRecord::Base
  attr_accessible :balance_in_cents, :currency
  validates :balance_in_cents, presence: true
  validates :currency, presence: true

  composed_of :balance,
              :class_name => "Money",
              mapping: [%w(balance_in_cents amount_in_cents),
                        %w(currency currency)]

end
