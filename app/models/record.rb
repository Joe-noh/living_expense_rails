class Record < ActiveRecord::Base
  has_many :items
  accepts_nested_attributes_for :items

  enum in_out: [:outgoing, :incoming]

  validates :purpose,     presence: true
  validates :responsible, format: {with: /\A[a-z][a-z0-9]*\z/}
end
