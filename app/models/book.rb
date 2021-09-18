class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, {length: {maximum: 200}}
  validates :body, presence: true


end
