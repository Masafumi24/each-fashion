class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         mount_uploader :image, ImageUploader

         has_many :posts
         has_many :comments
         has_many :likes, dependent: :destroy
         has_many :liked_posts, through: :likes, source: :post
         def already_liked?(post)
          self.likes.exists?(post_id: post.id)
        end
end
