class Idea < ApplicationRecord
  belongs_to :category
  has_many :images, through: :ideas_images

  validates :title, presence: true, uniqueness: true
end
