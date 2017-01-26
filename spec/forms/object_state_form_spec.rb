require 'rails_helper'

RSpec.describe ObjectStateForm, type: :form do

  let(:file) do
  {
    csv: fixture_file_upload('csv/valid_object_states.csv', 'text/csv')
  }
  end

  subject(:form) { described_class.new(file) }

  describe '.csv' do
    it { expect(form.csv).not_to be_nil }
  end

  describe '#save' do
    it { expect { form.save }.to change { ObjectState.count }.from(0).to(7) }

    it { expect(form.save).to be_truthy }
  end

  describe '#hashed_objects' do
    it { expect(form.hashed_objects.count).to eq(7) }
  end

end
