class CreateObjectStates < ActiveRecord::Migration[5.0]
  def change
    create_table :object_states do |t|
      t.integer :object_id
      t.string :object_type
      t.bigint :timestamp
      t.timestamps
    end
  end
end
