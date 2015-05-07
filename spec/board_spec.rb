require 'board'

describe Board do
  it { expect(subject.grid_retrieve('A1')).to eq nil }
  it { expect(subject.size).to be 100 }

  xit {expect(subject.map('A2')).to be ['A',2]}
end