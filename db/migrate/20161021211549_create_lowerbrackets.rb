class CreateLowerbrackets < ActiveRecord::Migration
  def change
    create_table :lowerbrackets do |t|
      t.string :round, limit: 2
      t.references :team, index: true

      t.timestamps null: false
    end
    add_foreign_key :lowerbrackets, :teams
  end
end
