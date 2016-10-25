class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :logo
      t.string :semester, limit: 2
      t.references :performance, index: true
      t.references :key, index: true
      t.references :phase, index: true

      t.timestamps null: false
    end
    add_foreign_key :teams, :performances
    add_foreign_key :teams, :keys
    add_foreign_key :teams, :phases
  end
end
