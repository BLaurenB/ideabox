class Image < ApplicationRecord
  has_many :ideas, through: :ideas_images

  validates :title, :image_path, presence: true, uniqueness: true
end
