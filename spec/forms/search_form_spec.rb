require 'rails_helper'

RSpec.describe SearchForm, type: :form do

  let!(:object_state) { create(:object_state, object_id: 1) }
  let(:params) { Hash.new }

  subject(:form) { described_class.new(params) }

  describe '#search' do
    context 'when search params returns a result' do
      let(:params) do
        {
          object_id: object_state.id,
          object_type: object_state.object_type
        }
      end

      it { expect(form.search).to include(object_state) }
    end

    context 'when search params doesn\'t return a result' do
      let(:params) do
        {
          object_id: 2,
          object_type: 'ABC'
        }
      end

      it { expect(form.search).not_to include(object_state) }
    end
  end

  describe '#object_id_options' do
    it { expect(form.object_id_options).to include(object_state.object_id) }
  end

  describe '#object_type_options' do
    it { expect(form.object_type_options).to include(object_state.object_type) }
  end

  describe '#timestamp_options' do
    it { expect(form.timestamp_options.flatten).to eq([Time.at(object_state.timestamp).utc, object_state.timestamp]) }
  end

end
