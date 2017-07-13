FactoryGirl.define do
  factory :category do
    sequence :title do |i|
      "Factory Worker #{i}"
    end
  end
end
