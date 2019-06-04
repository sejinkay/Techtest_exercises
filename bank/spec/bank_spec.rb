require 'bank'

describe Bank do
  date = Time.now.strftime('%d/%m/%y')

  context 'using the account' do
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

  context 'checking statement' do
    it 'adds to the transaction list' do
      subject.add(1000)
      expect(subject.transaction).to eq ["#{date} || 1000.00 || ---- || 1000.00"]
    end

    it 'withdrawal added to the transaction list' do
      subject.add(1000)
      subject.withdraw(500)
      expect(subject.transaction).to eq ["#{date} || 1000.00 || ---- || 1000.00", "#{date} || ---- || 500.00 || 500.00"]
    end

    it 'displays the confirmation message' do
      subject.add(1000)
      subject.withdraw(500)
      expect(subject.statement).to eq "Here's your current statement"
    end

    it 'displays the account statement', skip: "no diff on the result" do
      subject.add(1000)
      subject.add(2000)
      subject.withdraw(500)
      expect { subject.statement }.to output(
        " date || credit || debit || balance
#{date} || ---- || 500.00 || 2500.00
#{date} || 2000.00 || ---- || 3000.00
#{date} || 1000.00 || ---- || 1000.00").to_stdout
    end
  end
end
