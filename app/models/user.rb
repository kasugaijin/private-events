class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :attendings, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendings, dependent: :destroy

  # associates user_id with creator_id in events table and allows event.creator method
  has_many :events, foreign_key: :creator_id, class_name: "Event", dependent: :destroy
end
