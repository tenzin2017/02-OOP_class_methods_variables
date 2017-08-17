class Book

  @@on_shelf = []
  @@on_loan = []

  def initialize(title,author,isbn)
      @title = title
      @author = author
      @isbn = isbn
      @available = true
      @borrowed = false
      @over_due_list = []


  end

  def borrow
    if lent_out? == true
      return false
    else
      @due_date = Book.current_due_date
      @@on_shelf.each do |b|
        if b == self
          @@on_shelf.delete(self)
          @@on_loan << self
          @borrowed = true
            return true
        end
      end

      end
  end

  def return_to_library
   if lent_out? == true
     @@on_loan.each do |b|
       if b == self
         @@on_loan.delete(self)
         @@on_shelf << self
         @due_date = nil
         @borrowed = false
         return true
       end
    end
   else
      return false
    end
  end

  def lent_out?
      if @borrowed == true
        return true
      else
        return false
      end
  end

  def self.create(title,author,isbn)
    new_book = Book.new(title,author,isbn)
    @@on_shelf << new_book
    new_book
  end

  def self.current_due_date
     @due_date =  Time.now + (3*24*60*60)
     return @due_date
  end

  def self.over_due
    @over_due_list = []
    @@on_loan.each do |book|

    puts (book.due_date < Time.now ? "#{book.title}  is overdue!" : "" )
    end
end

  def due_date
    return Book.current_due_date
  end

  def self.browse
       @@on_shelf.sample
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end





end

sister_outsider = Book.create("Sister_outsider", "Audre Lorde", "123456789011")
aint_i = Book.create("Ain't I a woman ?", "Bell Hooks", "112233445566")
if_they_come = Book.create("If They Come in the morning", "Angela Y. Davis", "12312312312312")

puts Book.browse.inspect
puts Book.browse.inspect
puts Book.browse.inspect

puts Book.available.inspect

puts Book.borrowed.inspect

puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.due_date


puts Book.available.inspect
puts Book.borrowed.inspect
# puts Book.over_due.inspect

puts sister_outsider.return_to_library
puts sister_outsider.lent_out?
puts Book.available.inspect
