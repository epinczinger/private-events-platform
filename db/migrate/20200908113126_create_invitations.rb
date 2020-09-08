class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :event_attendee, null: false, foreign_key: true
      t.references :attended_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
