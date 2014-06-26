class Expense < ActiveRecord::Base
  has_many :items
  accepts_nested_attributes_for :items, reject_if: :all_blank

  validates :purpose,     presence: true
  validates :responsible, presence: true,
                          format: { with: /\A[a-z][a-z0-9]*\z/ }
  validates :in_out,      presence: true,
                          inclusion: { in: ["outgoing", "incoming"], message: "%{value} is invalid" }

  default_scope { order('payday') }

  def amount_total
    self.items.inject(0) do |sum, item|
      sum + item.amount_total
    end
  end

  def amount_total_to_s
    (self.income? ? '+ ' : '- ') + "#{self.amount_total} Yen"
  end

  def income?
    self.in_out == 'incoming'
  end

  def self.balance
    self.all.inject(0) do |sum, expense|
      sum + (expense.income? ? 1 : -1) * expense.amount_total
    end
  end

  def self.red?
    self.balance < 0
  end
end
