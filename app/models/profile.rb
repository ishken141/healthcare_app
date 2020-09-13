class Profile < ApplicationRecord 
  belongs_to :user   
  validates :certificaton, presence: true 
  mount_uploader :image, ImageUploader 
end
