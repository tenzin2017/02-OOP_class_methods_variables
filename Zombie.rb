class Zombie

    @@horde = []
    @@plague_level = 10
    @@max_speed = 5
    @@max_strength = 8
    @@default_speed = 1
    @@default_strength = 3


    def initialize(speed_zombie, strength_zombie)
      @speed_zombie = speed_zombie
      @strength_zombie = strength_zombie
    end

    def encounter
       if outrun_zombie? == true
         return " You got away"
       elsif outrun_zombie? == false || survive_attack? == false
         return "You died"
       else
         you = Zombie.new(5,5)
         @@horder << you
         return " You are now a zombie"
       end

    end


    def outrun_zombie?
        my_speed = rand(@@max_speed)
        if my_speed  > @strength_zombie
          return true
        else
          return false
        end
    end


    def survive_attack?
       my_strength = rand(@@max_strength)
       if my_strength > @strength_zombie
         return true
       else
         return false
       end

    end


    def self.all
        @@horde
    end


    def self.new_day
        some_die_off
        spawn
        increase_plague_level
    end


    def self.spawn
      num = rand(@@plague_level)
       num.times do
       @@horde << Zombie.new(rand(@@max_speed), rand(@@max_strength))
     end
    end


    def self.some_die_off
        random = rand(11)
        @@horde = @@horde.pop(random)

    end

    def self.increase_plague_level
       random = rand(3)
       @@plague_level += random
    end



end



puts Zombie.all.inspect
Zombie.new_day
puts Zombie.all.inspect
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]

puts zombie1.encounter
puts zombie2.encounter
Zombie.new_day
puts Zombie.all.inspect

zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[3]
zombie4 = Zombie.all[4]
zombie5 = Zombie.all[5]
zombie6 = Zombie.all[6]

puts zombie1.encounter
puts zombie2.encounter
puts zombie3.encounter
puts zombie4.encounter
puts zombie5.encounter
puts zombie6.encounter
