class Record < ActiveRecord::Base
  has_many :items
  accepts_nested_attributes_for :items

  validates :purpose,     presence: true
  validates :responsible, presence: true,
                          format: { with: /\A[a-z][a-z0-9]*\z/ }
  validates :in_out,      presence: true,
                          inclusion: { in: ["outgoing", "incoming"], message: "%{value} is invalid" }
end
