class AddStatusColumnToJamParticipants < ActiveRecord::Migration[5.0]
  def change
  	add_column :jam_participants, :status, :string
  end
end
