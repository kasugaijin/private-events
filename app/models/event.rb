class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
end

# belongs_to the creator_id column in events table, which is associated with users table