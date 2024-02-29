require 'spec_helper'

require_relative '../integer'

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

  describe 'comparison' do
    it 'comparison', :aggregate_failures do
      expect(9).to be > 7
      expect(9).to be >= 9
      expect(9).to be < 10
    end
  end

  describe 'predicate' do
    it 'predicatie', :aggregate_failures do
      expect(7).not_to be_zero
      expect([]).to be_empty

      hoge = { a: 1, b: 2 }
      expect(hoge).to have_key(:a)
    end
  end

  describe 'type' do
    it 'type', :aggregate_failures do
      expect(7).to be_kind_of(Integer)
      expect(7).to be_instance_of(Integer)
      expect(7).to be_a(Integer)
      expect(7).to be_kind_of(Numeric)
      expect(7).to be_kind_of(MyModule)
    end
  end
end
