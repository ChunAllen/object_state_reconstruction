require 'csv'

class ObjectStateForm < BaseForm

  attr_reader :csv

  def initialize(params = {})
    @csv = params[:csv]
  end

  def save
    flush_records!
    ObjectState.create(hashed_objects)
    errors.empty?
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:base, e.message) and return false
  end

  def hashed_objects
    CSV.foreach(csv.path, headers: true).entries.map(&:to_hash)
  end

  private

  def flush_records!
    ObjectState.destroy_all
  end

end
