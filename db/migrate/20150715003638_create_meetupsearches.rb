class CreateMeetupsearches < ActiveRecord::Migration
  def change
    create_table :meetupsearches do |t|
      t.string :name
      t.integer :user_id
      t.integer :recipient_id

      t.timestamps null: false
    end
  end
end
