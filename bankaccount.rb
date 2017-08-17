class BankAccount

  @@interest_rate = 0.02
  @@accounts = []


  def initialize
    @balance = 0


  end


  #Writer balance
  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
     @balance -= amount
  end

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    new_account
  end

  def self.total_funds
      @total = 0
     @@accounts.each do |account|
       @total += account.balance
     end
     @total
  end

  def self.interest_time

    @@accounts.each do |account|
      interest = account.balance * @@interest_rate
      account.deposit(interest)
    end

  end



end

lobs = BankAccount.create
lobs.deposit(100)
puts lobs.balance
lobs.deposit(200)
puts lobs.balance

sonam = BankAccount.create
sonam.deposit(500)
puts sonam.balance
puts sonam.inspect

puts BankAccount.total_funds
BankAccount.interest_time
puts lobs.balance
puts sonam.balance
