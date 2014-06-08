FactoryGirl.define do
  factory :record do
    purpose     "BBQ Party"
    responsible "jhonzawa"
    payday      Date.today
    in_out      "outgoing"

    after(:build) do |rec|
      3.times { rec.items << build(:item, record: rec) }
    end
  end
end
