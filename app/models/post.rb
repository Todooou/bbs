class Post < ApplicationRecord
    mount_uploader :picture, PictureUploader
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :body, presence: true
  end