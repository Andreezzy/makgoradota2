class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :games
      t.integer :wins
      t.integer :losses

      t.timestamps null: false
    end
  end
end
