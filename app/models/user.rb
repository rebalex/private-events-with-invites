class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :created_events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
  has_many :event_invitations, foreign_key: "invited_user_id"
  has_many :invited_events, through: :event_invitations
  has_many :accepted_event_invitations, -> { accepted }, class_name: "EventInvitation", foreign_key: :invited_user_id
  has_many :declined_event_invitations, -> { declined }, class_name: "EventInvitation", foreign_key: :invited_user_id
  has_many :pending_event_invitations, -> { pending }, class_name: "EventInvitation", foreign_key: :invited_user_id

  has_many :accepted_events, through: :accepted_event_invitations, source: :invited_event
  has_many :pending_events, through: :pending_event_invitations, source: :invited_event
  has_many :declined_events, through: :declined_event_invitations, source: :invited_event
end
