class CsvImportWorker
  include Sidekiq::Worker

  def perform_async
    ActiveRecord::Base.transaction do
    end
  end
end
