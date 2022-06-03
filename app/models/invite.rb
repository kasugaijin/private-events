class Invite < ApplicationRecord

  # create a scope to query if a user has been invited
  # use this to control invite/rescind invite button in Views>Events>show

  belongs_to :event
  belongs_to :inviter, class_name: 'User'
  belongs_to :invitee, class_name: 'User'

end