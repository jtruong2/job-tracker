FactoryGirl.define do
  factory :comment do
    sequence :content do |i|
      "Hello World #{i}"
    end
    job nil
  end
end
