class CreateControllers < ActiveRecord::Migration
  def change
    create_table :controllers do |t|
      t.string :meetupsearches

      t.timestamps null: false
    end
  end
end
