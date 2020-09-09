class Room < ApplicationRecord 
  has_many :messages, dependent: :destroy 
  belongs_to :user 
  mount_uploader :image, ImageUploader 
  def self.search(search) 
    if search  
      Room.where("box LIKE(?)", "%#{search}%") 
    else 
      Room.all 
    end 
  end 
end
