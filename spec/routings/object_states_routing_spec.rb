require 'rails_helper'

RSpec.describe ObjectStatesController, type: :routing do

  it { expect(get: '/').to route_to('object_states#index') }
  it { expect(post: '/object_states').to route_to('object_states#create') }
  it { expect(get: '/object_states/new').to route_to('object_states#new') }

end
