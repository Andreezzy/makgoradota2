class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :dni_dotero
      t.string :nickname
      t.string :name
      t.string :lastname
      t.string :phone, limit: 12
      t.references :team, index: true

      t.timestamps null: false
    end
    add_foreign_key :players, :teams
  end
end
