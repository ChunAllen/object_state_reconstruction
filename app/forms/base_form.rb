class BaseForm

  include ActiveModel::Model

  def initialize(params = {})
    self.attributes = params unless params.nil? || params.empty?
  end

end
