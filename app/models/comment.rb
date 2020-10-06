class Comment < ApplicationRecord
  belongs_to :post
  validates :content, presence: true, length: { minimum: 2 }
  belongs_to :user
end
