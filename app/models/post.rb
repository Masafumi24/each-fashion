class Post < ApplicationRecord
  validates :image, presence: true

  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
end
