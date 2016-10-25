class CreateSelecteds < ActiveRecord::Migration
  def change
    create_table :selecteds do |t|
      #t.integer :pick_1, :references => "hero", index: true
      t.references :pick_1
      t.references :pick_2
      t.references :pick_3
      t.references :pick_4
      t.references :pick_5
      t.references :match, index: true
      t.string :bando, limit: 7

      t.timestamps null: false
    end
    #add_foreign_key :selecteds, :heros
    add_foreign_key :selecteds, :matches
  end
end
