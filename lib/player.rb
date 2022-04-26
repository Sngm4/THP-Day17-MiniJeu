class Player
  attr_accessor :name, :life_points
  
  def initialize(name, life_points)
    @name = name
    @life_points = life_points
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
    if @life_points <= 0 
      puts "Le joueur #{@name} a été tué d'un coup de poignard dans la carotide, ce fût fatal !"
    end
  end

  def attack(target)
    puts "#{@name} attaque #{target.name}"
    damage_received = compute_damage
     if target.life_points > 0
      puts "Cette attaque lui inflige #{damage_received} point(s) de dommage !"
     end
    target.gets_damage(damage_received)
  end

  def compute_damage
    return rand(1..6)
  end

end
