class RenameJoinTable < ActiveRecord::Migration[7.2]
  def change
    rename_table :event_attendances, :event_invitations
  end
end
