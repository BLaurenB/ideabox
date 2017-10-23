FactoryGirl.define do
  factory :image do
    sequence(:title) {|n| "Image Title #{n}"}
    sequence(:image_path) {|n| "Image Path #{n}"}
    idea  #still keep this here!
  end
end
