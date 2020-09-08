class User < ApplicationRecord
    has_secure_password
    has_many :created_events, foreign_key: 'event_creator_id', class_name: 'Event'
    # has_many :event_attendees, foreign_key: 'event_attendee_id', class_name: 'Attend'
    # has_many :attended_events, through: :event_attendees
end
