class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.string :title
      t.text :message

      t.timestamps
    end
  end
end
