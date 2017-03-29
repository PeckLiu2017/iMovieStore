class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :title, presence: true

  has_many :reviews
  has_many :movie_relationships
  has_many :members, through: :movie_relationships, source: :user
end
