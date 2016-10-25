class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :letter, limit: 1
      t.references :team, index: true

      t.timestamps null: false
    end
    add_foreign_key :groups, :teams
  end
end
