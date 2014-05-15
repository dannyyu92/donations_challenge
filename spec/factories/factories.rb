FactoryGirl.define do
  factory :user do
    id "1"
    email "someuser@example.com"
    password "password"
  end

  factory :item do
    height "100"
    width "200"
    weight "300"
  end

  factory :donation_item, class: "Donation" do
    title "Some title"
    description "Some description"
    association :donatable, factory: :item
  end
end