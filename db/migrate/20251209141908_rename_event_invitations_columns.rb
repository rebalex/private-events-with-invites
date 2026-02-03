class RenameEventInvitationsColumns < ActiveRecord::Migration[7.2]
  def change
    rename_column :event_invitations, :attendee_id, :invited_user_id
    rename_column :event_invitations, :attended_event_id, :invited_event_id
  end
end
