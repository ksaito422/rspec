require 'spec_helper'

require_relative '../integer'
require_relative '../counter'

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

  describe 'all' do
    it 'all', :aggregate_failures do
      expect([1, 3, 5]).to all(be_odd)
      expect([1, 3, 5]).to all(be_an(Integer))
      expect([1, 3, 5]).to all(be < 10)
      expect([1, 3, 5]).to all(be_odd.and be < 10)
    end
  end

  describe 'be_within' do
    it 'be_within', :aggregate_failures do
      expect(27.5).to be_within(0.5).of(27)
      expect(27.5).to be_within(0.5).of(28)
      expect(27.5).to be_within(0.5).of(27.4)
      expect(27.5).not_to be_within(0.5).of(26.9)
    end
  end

  describe 'change' do
    it 'change', :aggregate_failures do
      expect { Counter.increment }.to change { Counter.count }.from(0).to(1)
      expect { Counter.increment }.to change { Counter.count }.by(1)
    end
  end

  describe 'contain_exactly' do
    it 'contain_exactly', :aggregate_failures do
      expect([1, 2, 3]).to contain_exactly(3, 2, 1)
      expect([1, 2, 3]).not_to contain_exactly(3, 2)
    end
  end

  describe 'cover' do
    it 'cover', :aggregate_failures do
      expect(1..10).to cover(5)
      expect(1..10).to cover(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
      expect(1..10).not_to cover(0)
      expect(1..10).not_to cover(11)
    end
  end

  describe 'end_with' do
    it 'end_with', :aggregate_failures do
      expect('hoge').to end_with('ge')
      expect('hoge').to end_with('oge')
      expect('hoge').not_to end_with('h')
    end
  end

  describe 'have_attributes' do
    it 'have_attributes', :aggregate_failures do
      Person = Struct.new(:name, :age)
      person = Person.new('hoge', 20)

      expect('hoge').to have_attributes(length: 4, upcase: 'HOGE')
      expect('hoge').not_to have_attributes(length: 3)
      expect(person).to have_attributes(name: 'hoge', age: 20)
    end
  end
end
