FactoryGirl.define do
  factory :item do
    name       "onion"
    count      3
    unit_price 100
    expense    :expense
  end
end
