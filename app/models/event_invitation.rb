class EventInvitation < ApplicationRecord
  belongs_to :invited_user, class_name: "User"
  belongs_to :invited_event, class_name: "Event", foreign_key: "invited_event_id", optional: true

  enum status: { pending: 0, accepted: 1, declined: 2 }

  scope :accepted, -> { where(status: :accepted) }
  scope :pending,  -> { where(status: :pending) }
  scope :declined, -> { where(status: :declined) }
end
