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

  factory :voucher do
    sequence(:expiration_date) { |n| 1.year.from_now }
  end

  factory :experience do
    primary_contact_name "John Doe"
    latitude "40.7527987"
    longitude "-73.974788"
  end

  # Polymorphic Associations
  factory :donation_item, class: "Donation" do
    title "Some item title"
    description "Some item description"
    association :donatable, factory: :item
  end

  factory :donation_voucher, class: "Donation" do
    title "Some voucher title"
    description "Some voucher description"
    association :donatable, factory: :voucher
  end

  factory :donation_experience, class: "Donation" do
    title "Some experience title"
    description "Some experience description"
    association :donatable, factory: :experience  
  end
end