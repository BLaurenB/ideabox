class Idea < ApplicationRecord
  belongs_to :category
  belongs_to :user 
  has_many :ideas_images
  has_many :images, through: :ideas_images

  validates :title, presence: true, uniqueness: true



end
