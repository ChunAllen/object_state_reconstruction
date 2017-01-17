require 'rails_helper'

RSpec.describe ObjectStatesController, type: :controller do

  let!(:object_state) { create(:object_state, object_id: 1) }

  describe 'GET #index' do
    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:object_states)).to include(object_state) }
  end

end
