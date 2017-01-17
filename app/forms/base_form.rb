class BaseForm

  include ActiveModel::Model
  include ActiveModel::AttributeMethods

  def initialize(params = {})
    super(params)
  end

end

