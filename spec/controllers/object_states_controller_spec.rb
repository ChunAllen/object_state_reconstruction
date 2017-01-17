require 'rails_helper'

RSpec.describe ObjectStatesController, type: :controller do

  let!(:object_state) { create(:object_state, object_id: 1) }

  describe 'GET #index' do
    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:object_states)).to include(object_state) }
    it { expect(assigns(:search_form)).to be_a(SearchForm) }
  end

  describe 'GET #new' do
    before { get :new, xhr: true }

    it { is_expected.to render_template(:new) }
  end

  #describe 'POST #create' do
    #before { post :create, file_upload: { csv: '' } }

    #it { expect(assigns(:object_state)).to be_a(ObjectStateForm) }
  #end

end
