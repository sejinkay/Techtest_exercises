class Bank
  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @transaction = []
    @date = Time.now.strftime('%d/%m/%y')
  end

  def deposit(amount)
    @balance += amount
    @transaction << "#{@date} || #{'%.2f' % amount} || ---- || #{'%.2f' % @balance}"
    "Your current balance is #{'%.2f' % @balance}"
  end

  def withdraw(amount)
    @balance -= amount
    @transaction << "#{@date} || ---- || #{'%.2f' % amount} || #{'%.2f' % @balance}"
    "Your current balance is #{'%.2f' % @balance}"
  end

  def statement
    puts " date || credit || debit || balance"
    @transaction.reverse.each { |x| puts x }
    "Here's your current statement"
  end

end
