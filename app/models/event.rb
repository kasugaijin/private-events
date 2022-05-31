class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  validates :name, :location, :date, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end

# belongs_to the creator_id column in events table, which is associated with users table