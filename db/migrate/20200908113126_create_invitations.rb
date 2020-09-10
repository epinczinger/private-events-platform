class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :event_attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
