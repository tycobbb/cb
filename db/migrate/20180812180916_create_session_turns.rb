class CreateSessionTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :session_turns do |t|
      t.integer :session_id, null: false
      t.json :state, null: false
      t.json :input
      t.index :session_id
    end
  end
end
