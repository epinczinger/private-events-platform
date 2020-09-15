class AddIndexToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_index :invitations, :attended_event_id
    add_index :invitations, :event_attendee_id
  end
end
