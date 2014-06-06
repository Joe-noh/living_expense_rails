class Item < ActiveRecord::Base
  belongs_to :record

  validates :name,       presence: true
  validates :count,      numericality: {greater_than: 0}
  validates :count,      numericality: {only_integer: true}
  validates :unit_price, numericality: {greater_than: 0}
  validates :unit_price, numericality: {only_integer: true}
end
