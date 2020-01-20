RSpec.describe Xencoder do
  it { expect(described_class.new('01')).to be_a Xencoder::Encoder }

  context 'default encoder' do
    subject(:encoder) { described_class.encoder }
    it { expect(subject.seed).to eq 100 }
    it { expect(subject.length).to eq 8 }
    it { expect(subject.chars).to match_array '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.chars }
  end

  it { expect(described_class.encode(999)).to eq 'Xp4x0Ybq' }
  it { expect(described_class.decode('Xp4x0Ybq')).to eq 999 }

end
