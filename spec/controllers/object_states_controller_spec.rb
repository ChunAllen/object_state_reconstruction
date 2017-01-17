require 'rails_helper'

RSpec.describe ObjectStatesController, type: :controller do

  describe 'GET #index' do
    before { get :index }

    it { is_expected.to render_template(:index) }
  end

end
