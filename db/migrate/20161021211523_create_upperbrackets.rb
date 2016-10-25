class CreateUpperbrackets < ActiveRecord::Migration
  def change
    create_table :upperbrackets do |t|
      t.string :round, limit: 2
      t.references :team, index: true

      t.timestamps null: false
    end
    add_foreign_key :upperbrackets, :teams
  end
end
