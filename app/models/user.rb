class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # sets method name for user.events and associates user_id with creator_id in events table
  has_many :events, foreign_key: :creator_id, class_name: "Event"
end
