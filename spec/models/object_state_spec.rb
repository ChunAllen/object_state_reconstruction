require 'rails_helper'

RSpec.describe ObjectState, type: :model do

  it { is_expected.to validate_presence_of(:object_id) }
  it { is_expected.to validate_presence_of(:object_type) }
  it { is_expected.to validate_presence_of(:timestamp) }

end
