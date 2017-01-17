require 'csv'

class ObjectStateForm < BaseForm

  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def save
    flush_records
    CSV.foreach(params[:csv].path, headers: true).each do |row|
      ObjectState.create!(row.to_hash.except('object_changes'))
    end
    true
  end

  private

  def flush_records
    ObjectState.destroy_all
  end

end
