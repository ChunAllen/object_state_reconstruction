class CreateObjectStates < ActiveRecord::Migration[5.0]
  def change
    create_table :object_states do |t|
      t.integer :object_id, null: false
      t.string :object_type, null: false
      t.bigint :timestamp, null: false
      t.timestamps
    end
  end
end
