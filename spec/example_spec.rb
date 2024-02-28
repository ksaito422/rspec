require 'spec_helper'

RSpec.describe do
  describe 'equality' do
    it 'equal', :aggregate_failures do
      expect(1).to equal(1)
      expect(1).to eql(1)
      expect(1).to be == 1
      expect(1).to be(1)
      expect(1).to eq(1)
      expect(1).not_to eq(2)
    end
  end
end
