class Room < ApplicationRecord 
  has_many :messages, dependent: :destroy 
  belongs_to :user 
  mount_uploader :image, ImageUploader 
end
