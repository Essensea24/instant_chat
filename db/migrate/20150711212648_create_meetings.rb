class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :location
      t.datetime :time
      t.string :description
      t.string :user_id
      t.string :receiver_id

      t.timestamps null: false
    end
  end
end
