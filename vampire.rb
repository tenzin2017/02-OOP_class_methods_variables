class Vampire
 @@coven = []

  def initialize(name,age,in_coffin,drank_blood_today)
    @name = name
    @age = age
    @in_coffin = in_coffin
    @drank_blood_today = drank_blood_today
  end

  def self.create(name,age,in_coffin,drank_blood_today)
    new_vampire = Vampire.new(name,age,in_coffin,drank_blood_today)
    @@coven << new_vampire
    new_vampire
  end

  def in_coffin
    @in_coffin
  end

  def in_coffin=(in_coffin)
    @in_coffin = in_coffin
  end

  def drank_blood_today=(drank_blood_today)
    @drank_blood_today = drank_blood_today
  end

  def drank_blood_today
    @drank_blood_today
  end

  def drink_blood
    @drank_blood_today = true
  end

  def self.sunrise
    @@coven.each do |vampire|
    if vampire.in_coffin == false || vampire.drank_blood_today == false
     @@coven.delete(vampire)
  end
  end
  end

  def self.sunset
   @@coven.each do |vampire|
     vampire.drank_blood_today = false
     vampire.in_coffin = false
  end
end

  def go_home
    @in_coffin = true
  end

end


vampire1 = Vampire.create("sam", "100", true, true)
vampire2 = Vampire.create("bbb", "111", true, true)
vampire3 = Vampire.create("ccc", "112", false, false)
puts vampire1.inspect
puts Vampire.sunrise
puts vampire3.inspect

vampire3.go_home
vampire3.drank_blood_today
puts vampire3.inspect
