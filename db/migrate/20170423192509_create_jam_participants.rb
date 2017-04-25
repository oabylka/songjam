class CreateJamParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :jam_participants do |t|
      t.integer :user_id
      t.integer :jam_id

      t.timestamps
    end
  end
end
