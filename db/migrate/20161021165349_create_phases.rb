class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :des

      t.timestamps null: false
    end
  end
end
