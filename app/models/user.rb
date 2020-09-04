class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
  has_one :profile  
  has_many :rooms
  accepts_nested_attributes_for :profile
  has_many :messages 
  has_many :likes, dependent: :destroy 
end
