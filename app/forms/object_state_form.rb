require 'csv'

class ObjectStateForm < BaseForm

  attr_reader :csv

  def initialize(params = {})
    @csv = params[:csv]
  end

  def save
    flush_records
    CSV.foreach(csv.path, headers: true).each do |row|
      ObjectState.create!(row.to_hash.except('object_changes'))
    end
    true
  end

  private

  def flush_records
    ObjectState.destroy_all
  end

end
