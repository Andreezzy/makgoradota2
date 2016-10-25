class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :date
      t.boolean :result
      t.string :round, limit: 2
      t.string :idgame, limit: 12
      #t.integer :team_1_id, :references => "team", index: true
      #t.integer :team_2_id, :references => "team", index: true
      t.references :team_1
      t.references :team_2
      t.references :phase, index: true

      t.timestamps null: false
    end
    #add_foreign_key :matches, :teams
    add_foreign_key :matches, :phases
  end
end
