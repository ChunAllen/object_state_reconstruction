require 'csv'

class ObjectStateForm < BaseForm

  attr_reader :csv

  def initialize(params = {})
    @csv = params[:csv]
  end

  # Flushes Object States and Creates hashed objects they are inside a transaction
  def save
    ActiveRecord::Base.transaction do
      flush_records!
      ObjectState.create!(hashed_objects)
    end
    errors.empty?
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:base, e.message) and return false
  end

  # Creates array of hashes
  def hashed_objects
    CSV.foreach(csv.path, headers: true).entries.map(&:to_hash)
  end

  private

  def flush_records!
    ObjectState.destroy_all
  end

end
