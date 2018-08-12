class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :game_id, null: false
      t.index :game_id
    end
  end
end
