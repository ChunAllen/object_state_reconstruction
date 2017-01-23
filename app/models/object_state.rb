class ObjectState < ApplicationRecord

  validates :object_id, :object_type, :timestamp, presence: true

  serialize :object_changes, JSON

end
