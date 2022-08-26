class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :pic, dependent: :destroy

  validates :gender, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 13, less_than_or_equal_to: 120 }
end
