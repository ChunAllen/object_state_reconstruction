class AddObjectChangesToObjectStates < ActiveRecord::Migration[5.0]
  def change
    add_column :object_states, :object_changes, :jsonb, default: {}, null: false
    add_index :object_states, :object_changes, using: :gin
  end
end
