class CsvImportWorker
  include Sidekiq::Worker
  include ActiveModel::Model

  # Flushes Object States and Creates hashed objects they are inside a transaction
  def perform(object_states)
    ActiveRecord::Base.transaction do
      flush_records!
      ObjectState.create!(object_states)
    end
  end

  private

  def flush_records!
    ObjectState.destroy_all
  end

end
