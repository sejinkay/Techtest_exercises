require 'bank'

describe Bank do
  date = Time.now.strftime('%d/%m/%y')

  context 'using the account' do
    it 'shows the balance' do
      expect(subject.balance).to eq 0
    end

    it 'adds the balance' do
      subject.deposit(1000)
      expect(subject.balance).to eq 1000
    end

    it 'withdraws the balance' do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.balance).to eq 500
    end
  end

  context 'checking statement' do
    it 'adds to the transaction list' do
      subject.deposit(1000)
      expect(subject.transaction).to eq ["#{date} || 1000.00 || ---- || 1000.00"]
    end

    it 'withdrawal added to the transaction list' do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.transaction).to eq ["#{date} || 1000.00 || ---- || 1000.00", "#{date} || ---- || 500.00 || 500.00"]
    end

    it 'displays the confirmation message' do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.statement).to eq "Here's your current statement"
    end
  end
end
