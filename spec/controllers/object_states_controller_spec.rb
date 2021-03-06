require 'rails_helper'

RSpec.describe ObjectStatesController, type: :controller do

  describe 'GET #index' do
    let!(:object_state) { create(:object_state, object_id: 1) }
    before { get :index }

    it { is_expected.to render_template(:index) }
    it { expect(assigns(:search_form)).to be_a(SearchForm) }
  end

  describe 'GET #new' do
    before { get :new, xhr: true }

    it { is_expected.to render_template(:new) }
  end

  describe 'POST #create' do
    context 'with valid csv' do
      before :each do
        file = fixture_file_upload('csv/valid_object_states.csv', 'text/csv')
        post :create, params: { file_upload: { csv: file } }
      end

      it { expect(ObjectState.count).to eq(7) }
      it { expect(flash[:notice]).to be_present }
      it { is_expected.to redirect_to(object_states_path) }
    end

    context 'with invalid csv' do
      before :each do
        file = fixture_file_upload('csv/invalid_object_states.csv', 'text/csv')
        post :create, params: { file_upload: { csv: file } }
      end

      it { expect(ObjectState.count).to eq(0) }
      it { expect(flash[:error]).to be_present }
      it { is_expected.to redirect_to(object_states_path) }
    end
  end

end
