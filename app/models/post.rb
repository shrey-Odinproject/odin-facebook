class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 3 }
end
