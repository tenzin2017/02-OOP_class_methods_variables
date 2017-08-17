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
   @drank_blood_today = false
   @in_coffin = false
  end

  def self.go_home
    @in_coffin = true
  end

end


vampire1 = Vampire.create("sam", "100", true, true)
puts vampire1.inspect
