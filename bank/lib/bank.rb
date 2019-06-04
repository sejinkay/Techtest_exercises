class Bank
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def add(deposit)
    @balance += deposit
  end

  def withdraw(deposit)
    @balance -= deposit
  end
  
end
