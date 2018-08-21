class CreateGameCards < ActiveRecord::Migration[5.2]
  def change
    create_table :game_cards do |t|
      t.integer :game_id, null: false
      t.string :name, null: false
      t.string :text, null: false
      t.index :game_id
    end
  end
end
