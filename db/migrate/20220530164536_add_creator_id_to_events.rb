class AddCreatorIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :creator, index: true
    add_foreign_key :events, :users, column: :creator_id
  end
end

# Because we are using custom naming (i.e. creator instead of user), this migration 
# is a little different to a basic add_reference. Instead, we add the reference 
# to events with the name 'creator', which creates a creator_id column, then we add 
# the foreign key constraint to maintain referential integrity. Last, we need to declare
# in the Event model that events belongs to :creator, class name 'User' to tie that
# association to a custom name.