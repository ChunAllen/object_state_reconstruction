require 'csv'

class ObjectStateForm < BaseForm

  attr_reader :csv

  def initialize(params = {})
    @csv = params[:csv]
  end

  def save
    CsvImportWorker.perform_async(hashed_objects)
  end

  # Creates array of hashes
  def hashed_objects
    CSV.foreach(csv.path, headers: true).entries.map(&:to_hash)
  end

end
