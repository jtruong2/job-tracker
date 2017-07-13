FactoryGirl.define do
  factory :job do
    title
    description "College level"
    level_of_interest 60
    city "Denver"

    association :company
  end

  sequence :title do |i|
    "Teacher #{i}"
  end

end
