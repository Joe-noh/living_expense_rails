FactoryGirl.define do
  factory :expense do
    purpose     "BBQ Party"
    responsible "jhonzawa"
    payday      Date.today
    in_out      "outgoing"
  end

  factory :expense_800, parent: :expense do
    after(:build) do |rec|
      rec.items << build(:item_300, expense: rec)
      rec.items << build(:item_500, expense: rec)
    end
  end
end
