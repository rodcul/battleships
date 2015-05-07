require 'board'

describe Board do
  it { expect(subject.grid.class).to eq Array }
  it { expect(subject.grid).to be_empty }
end