require 'bank'

describe Bank do
  it 'shows the balance' do
    expect(subject.balance).to eq 0
  end
end
