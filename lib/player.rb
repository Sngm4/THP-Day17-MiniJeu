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

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name, life_points, weapon_level)
    @weapon_level = weapon_level
    super(name, life_points)
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et en plus une arme de niveau #{weapon_level} !"
  end
  
  def search_weapon
    rand(1..6) = new_weapon
    puts "GG ! Tu viens de trouver une nouvelle arme de niveau #{new_weapon}"
    if new_weapon > weapon_level do
      weapon_level = new_weapon
      puts "Cette arme est meilleur que la tienne, tu l'as prends !"
    else 
      new_weapon <= weapon_level do 
        puts "DAMN, cette arme vaut R. Autant garder celle que tu as déjà..."
      end
  end

  def search_health_pack
    rand(1..6) = pack
    if pack == 1
      puts "Tu n'as rien trouvé..."
    elsif pack == 2..5 do 
       if life_points <=50  do
        life_points = life_points + 50
        puts "GG BG ! Tu viens de trouver un pack de +50 points de vie"
       else life_points > 100 do
        puts "Tu as trouvé 50 points de vie, mais tu as déjà 100 points !"
       end
    elsif pack == 6 do
      if life_points < 100 &&  
      puts 


  def compute_damage
    rand(1..6) * @weapon_level
  end
end

