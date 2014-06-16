FactoryGirl.define do
  factory :expense do
    purpose     "BBQ Party"
    responsible "jhonzawa"
    payday      Date.today
    in_out      "outgoing"

    after(:build) do |rec|
      3.times { rec.items << build(:item, expense: rec) }
    end
  end
end
