RSpec.describe Xencoder do
  it { expect(described_class.new('01')).to be_a Xencoder::Encoder }
  it { expect(described_class.new('0123456789abcdef', length: 4, seed: 200)).to be_a Xencoder::Encoder }

  context 'default encoder' do
    subject(:encoder) { described_class.encoder }
    it { expect(subject.seed).to eq 1 }
    it { expect(subject.length).to eq 6 }
    it { expect(subject.chars).to match_array '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.chars }
  end

  it { expect(described_class.encode(999)).to eq 'P0u4bN' }
  it { expect(described_class.decode('P0u4bN')).to eq 999 }

end
