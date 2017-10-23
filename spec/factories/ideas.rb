FactoryGirl.define do
  factory :idea do
    sequence(:title) {|n| "Idea Title #{n}"}
    sequence(:description) {|n| "Idea Description #{n}"}
    category
    image
  end
end
