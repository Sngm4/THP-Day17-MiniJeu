class Player
  attr_accessor :name, :life_points
  
  def initialize(name)
    @name = name
    @life_points = 10
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
    puts "#{@name} attaque #{target.name}\n\n"
    damage_received = compute_damage
     if target.life_points > 0
      puts "Cette attaque lui inflige #{damage_received} point(s) de dommage !\n\n"
      puts "-"*40
     end
    target.gets_damage(damage_received)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et en plus une arme de niveau #{weapon_level} !"
  end
  
  def search_weapon
    new_weapon = rand(1..6)
    puts "GG ! Tu viens de trouver une nouvelle arme de niveau #{new_weapon}\n\n"
    if new_weapon > weapon_level then
      weapon_level = new_weapon
      puts "Cette arme est meilleur que la tienne, tu l'as prends !"
    else
      puts "DAMN, cette arme vaut R. Autant garder celle que tu as déjà..."
    end
  end

  def search_health_pack
    pack = rand(1..6)
    if pack == 1
      puts "Tu n'as rien trouvé..."
    elsif pack == 2..5 then 
       if @life_points <= 50 then
        @life_points = @life_points + 50
       elsif @life_points > 50 then
        @life_points = 100
        puts "GG BG ! Tu viens de trouver un pack de +50 points de vie, attention tu ne peux pas dépasser 100 points dans tous les cas.\n\n"
       end
    elsif pack == 6 then
      if @life_points <= 20 then
        @life_points = @life_points + 80
       elsif @life_points > 20 then
        @life_points = 100
        puts "GG BG ! Tu viens de trouver un pack de + 80 points de vie, attention tu ne peux pas dépasser 100 points dans tous les cas."
       end
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end
end



