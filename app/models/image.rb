class Image < ApplicationRecord
  has_many :ideas_images
  has_many :ideas, through: :ideas_images

  validates :title, :image_path, presence: true, uniqueness: true

  def photo
    ActionController::Base.helpers.image_tag(image_path, size: "300x200")
  end

end
