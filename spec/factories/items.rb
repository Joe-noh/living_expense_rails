FactoryGirl.define do
  factory :item do
    name        "onion"
    count       3
    unit_price  100
    association :expense
  end

  factory :item_300, parent: :item do
  end

  factory :item_500, parent: :item do
    count 5
  end
end
