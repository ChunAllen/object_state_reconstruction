class SearchForm < BaseForm

  validates :object_id, :object_type, :timestamp, presence: true

  attr_accessor :object_id, :object_type, :timestamp

  def initialize(params = {})
    super(params)
  end

  def search
    result = klass.where("object_id = ? AND object_type = ? AND timestamp <= ?", object_id, object_type, timestamp)
    reconstruct(result.order(:timestamp))
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

  def reconstruct(result)
    result.map { |obj| JSON.parse(obj.object_changes) }.reduce(&:merge) || {}
  end

end
