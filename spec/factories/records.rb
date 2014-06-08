FactoryGirl.define do
  factory :record do
    purpose     "BBQ Party"
    responsible "jhonzawa"
    payday      Date.today
    in_out      "outgoing"
  end
end