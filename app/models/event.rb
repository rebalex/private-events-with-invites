class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :event_invitations, foreign_key: "invited_event_id"
  has_many :invited_users, through: :event_invitations

  scope :past, -> { where("datetime < ?", Time.current) }
  scope :future, -> { where("datetime >= ?", Time.current) }

  has_many :accepted_event_invitations, -> { where(status: :accepted) }, class_name: "EventInvitation", foreign_key: :invited_event_id
  has_many :accepted_users, through: :accepted_event_invitations, source: :invited_user

  def host?(user)
    creator == user
  end
end
