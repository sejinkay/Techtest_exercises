require 'bank'

describe Bank do
  it 'shows the balance' do
    expect(subject.balance).to eq 0
  end

  it 'adds the balance' do
    subject.add(1000)
    expect(subject.balance).to eq 1000
  end

  it 'withdraws the balance' do
    subject.add(1000)
    subject.withdraw(500)
    expect(subject.balance).to eq 500
  end
end
