class Post < ApplicationRecord
  belongs_to :user

  validates :month, presence: true
  validates :day, presence: true
  validates :access, presence: true
  validates :post, presence: true

end
