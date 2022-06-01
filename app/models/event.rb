class Event < ApplicationRecord
  
  
  has_many :attendings, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendings, dependent: :destroy
  belongs_to :creator, class_name: "User"
  
  validates :name, :location, :date, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end

# belongs_to the creator_id column in events table, which is associated with users table