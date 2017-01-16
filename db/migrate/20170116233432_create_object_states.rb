class CreateObjectStates < ActiveRecord::Migration[5.0]
  def change
    create_table :object_states do |t|

      t.timestamps
    end
  end
end
