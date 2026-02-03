class AddStatusToEventInvitations < ActiveRecord::Migration[7.2]
  def change
     add_column :event_invitations, :status, :integer, default: 0, null: false
  end
end
