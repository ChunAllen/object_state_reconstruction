require 'rails_helper'

RSpec.describe SearchForm, type: :form do

  let!(:object_state) { create(:object_state, object_id: 1) }

  subject(:form) { described_class.new }

  describe '#search' do
  end

  describe '#object_id_options' do
    it { expect(form.object_id_options).to include(object_state.object_id) }
  end

  describe '#object_type_options' do
    it { expect(form.object_type_options).to include(object_state.object_type) }
  end

end
