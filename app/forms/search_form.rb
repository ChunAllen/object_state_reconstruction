class SearchForm < BaseForm

  # Uncomment this if you want to validate required params
  # validates :object_id, :object_type, :timestamp, presence: true

  attr_accessor :object_id, :object_type, :timestamp

  def initialize(params = {})
    super(params)
  end

  # Returns ActiveRecord::Relation based on search params
  def search_result
    klass.where("object_id = ? AND object_type = ? AND timestamp <= ?", object_id, object_type, timestamp).order(:timestamp)
  end

  # Merges all object_changes at a particular timestamp
  def object_changes
    object_changes = search_result.map { |obj| JSON.parse(obj.object_changes) }
    object_changes.reduce(&:merge) || {}
  end

  def object_id_options
    klass.pluck(:object_id).uniq
  end

  def object_type_options
    klass.pluck(:object_type).uniq
  end

  private

  def klass
    ObjectState
  end

end
