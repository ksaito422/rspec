RSpec.describe do
  describe 'basics' do
    it 'double', :aggregate_failures do
      dbl = double('Some Collaborator', :foo => 3, :bar => 4)
      expect(dbl.foo).to eq(3)
      expect(dbl.bar).to eq(4)
    end

    it 'allow', :aggregate_failures do
      dbl = double('Some Collaborator')
      allow(dbl).to receive(:foo).and_return(3)
      allow(dbl).to receive_messages(:hoge => 3, :fuga => 4)
      expect(dbl.foo).to eq(3)
      expect(dbl.hoge).to eq(3)
      expect(dbl.fuga).to eq(4)
    end

    it 'expecting messages', :aggregate_failures do
      dbl = double('Some Collaborator')
      expect(dbl).to receive(:foo)
      dbl.foo
    end

    it 'spy', :aggregate_failures do
      invitation = spy('invitation')
      invitation.deliver
      expect(invitation).to have_received(:deliver)
    end
  end
end
