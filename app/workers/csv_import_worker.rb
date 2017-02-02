class CsvImportWorker
  include Sidekiq::Worker

  def perform(object_state_params)
    ObjectStateForm.new(object_state_params).save
  end

end
