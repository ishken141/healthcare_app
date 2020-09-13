class Room < ApplicationRecord 
  has_many :messages, dependent: :destroy 
  has_many   :likes, dependent: :destroy
  has_many   :liked_users, through: :likes, source: :user
  belongs_to :user 
  mount_uploader :image, ImageUploader 
  validates :box, presence: true 
  def self.search(search) 
    if search  
      Room.where("box LIKE(?)", "%#{search}%") 
    else 
      Room.all 
    end 
  end 
end
