require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#flash_class' do
    it { expect(flash_class('success')).to eq('alert-success') }
  end

end
