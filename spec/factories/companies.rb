FactoryGirl.define do
  factory :company do
    name
  end

  sequence :name do |i|
    "Coca-Cola #{i}"
  end
end
