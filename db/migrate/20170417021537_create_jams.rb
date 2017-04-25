class CreateJams < ActiveRecord::Migration[5.0]
  def change
    create_table :jams do |t|
      t.string :name
      t.string :song
      t.datetime :date
      t.string :location
      t.integer :owner_user_id

      t.timestamps
    end
  end
end
