class Post < ApplicationRecord
    mount_uploader :picture, PictureUploader
    has_many :comments, dependent: :destroy
    validates :body, presence: true, length: { maximum: 1000 }    
    belongs_to :user
  end