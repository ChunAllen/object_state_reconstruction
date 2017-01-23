require 'rails_helper'

RSpec.describe SearchForm, type: :form do

  let(:file) do
  {
    csv: fixture_file_upload('csv/valid_object_states.csv', 'text/csv')
  }
  end
  let(:params) { Hash.new }

  before { ObjectStateForm.new(file).save }

  subject(:form) { described_class.new(params) }

  describe '#search' do
    context 'when search params returns a result' do
      let(:params) do
        {
          object_id: 1,
          object_type: 'Order',
          timestamp: 1484733173
        }
      end

      it { expect(form.search_result).not_to be_empty }
    end

    context 'when search params doesn\'t return a result' do
      let(:params) do
        {
          object_id: 1,
          object_type: 'Order',
          timestamp: 1484722542
        }
      end

      it { expect(form.search_result).to be_empty }
    end
  end

  describe '#object_changes' do
    context 'when object_changes reconstructed' do
      let(:params) do
        {
          object_id: 1,
          object_type: 'Order',
          timestamp: 1484733173
        }
      end

      it { expect(form.object_changes).to eq({"customer_name"=>"Jack", "customer_address"=>"Trade St.", "status"=>"paid", "ship_date"=>"2017-01-18", "shipping_provider"=>"DHL"}) }
    end

    context 'when object_changes doesn\'t reconstructed' do
      let(:params) do
        {
          object_id: 1,
          object_type: 'Order',
          timestamp: 1484722542
        }
      end

      it { expect(form.object_changes).to eq({}) }
    end
  end

  describe '#object_id_options' do
    it { expect(form.object_id_options).to contain_exactly(1, 2) }
  end

  describe '#object_type_options' do
    it { expect(form.object_type_options).to contain_exactly('Order', 'Product', 'Invoice') }
  end

end
