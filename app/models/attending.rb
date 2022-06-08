class Attending < ApplicationRecord

  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  validates_presence_of :attendee_id, :attended_event_id
end