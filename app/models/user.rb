class User < ApplicationRecord
  has_secure_password

  has_many :created_events, foreign_key: :event_creator_id, class_name: 'Event'
  has_many :invitations, foreign_key: :event_attendee_id
  has_many :attended_events, through: :invitations

  validates :name, :email, presence: true
  validates_uniqueness_of :name

  scope :past, -> { where(['event_date < ?', Date.today]) }
  scope :upcoming, -> { where(['event_date > ?', Date.today]) }
end
