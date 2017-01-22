class SearchForm < BaseForm

  attr_accessor :object_id, :timestamp

  def initialize(params = {})
    super(params)
  end

  def search
    finder = klass.all
    finder = finder.where(object_id: object_id) unless object_id.blank?
    finder = finder.where(timestamp: timestamp) unless timestamp.blank?
    finder
  end

  def object_id_options
    klass.pluck(:object_id).uniq
  end

  def object_type_options
    klass.pluck(:object_type).uniq
  end

  def timestamp_options
    klass.all.map { |k| [Time.at(k.timestamp).utc, k.timestamp] }
  end

  private

  def klass
    ObjectState
  end

end
