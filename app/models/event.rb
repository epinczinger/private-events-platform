class Event < ApplicationRecord
    belongs_to :event_creator, class_name: "User"
    has_many :invitations, foreign_key: :attended_event_id
    has_many :event_attendees, through: :invitations, source: :event_attendee

    scope :past, -> { where(['event_date < ?', Date.today]) }
    scope :upcoming, -> { where(['event_date > ?', Date.today]) }

    validates :event_name, :event_description, :event_location, :event_date, presence: true
end
