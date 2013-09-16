class Money #< ActiveRecord::Base
  include Comparable
  attr_accessor :amount_in_cents, :currency

  def initialize(amount_in_cents, currency)
    @amount_in_cents = amount_in_cents
    @currency = currency
  end

  def amount
    @amount_in_cents/100
  end

  def <=>(other_money)
    @amount_in_cents <=> other_money.amount_in_cents
  end


end
