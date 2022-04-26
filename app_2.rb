require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Iris La Sanguinaire")
player2 = Player.new("Matthias Le Mercenaire")

puts "*"*100
puts ""
puts "\"Bienvenue dans notre nouveau jeu de combat sans merci !\"\n\n"
puts "\"Quel est ton prénom ?\""
human1name = gets.chomp
humanplayer1 = HumanPlayer.new(human1name)
enemies = [player1, player2]
puts "*"*100
puts ""
puts "Suite à l'annonce, le public est en délire et crie pour accueuillir notre combattant.\n\n"
puts "*"*100
puts ""
puts "L'individu s'avance est dit : \" Je suis #{humanplayer1.name} & j'ai #{humanplayer1.life_points} points de vie et je me battrais corps et âme pour la victoire!\""
puts "Nous vous présentons maintenant vos deux adversaires, le torse bombé d'assurance le premier s'écrit :\"Je m'appelle #{player1.name} et rien n'y personne ne peut me vaincre !\" Le second adversaire en courant se prépicite et dit à son tour : Je suis #{player2.name}."
puts ""
puts "Les deux adversaires ont respectivement :\n- #{player1.name} #{player1.life_points} points de vie.\n- Et #{player2.name} #{player2.life_points} points de vie également. \nLe combat va pouvoir commencer... Et parce que je l'ai décidé ce sera #{humanplayer1.name} qui commence."
puts "*"*100
puts ""

while humanplayer1.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)do 
  puts  "#{humanplayer1.name} a #{humanplayer1.life_points} points."

  #menu
  puts "Quelle action veux-tu effectuer ?\n\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner\n\n" 
  puts "Attaquer un joueur en vue :"
  puts "0 - #{player1.name} a #{player1.life_points} points de vie"
  puts "1 - #{player2.name} a #{player2.life_points} points de vie"
  print ">"
  

  case gets.chomp
    when "a"
      humanplayer1.search_weapon
    when "s"
      humanplayer1.search_health_pack
    when "0"
      humanplayer1.attack(player1)
    when "1"
      humanplayer1.attack(player2)
    else
      puts "Vous faites n'importe quoi ! Choisissez un caractère valide m'enfin !"
  end

  #riposte
  puts "Les autres joueurs t'attaquent !"
    enemies.each do |enemy|
      if enemy.life_points > 0
        enemy.attack(humanplayer1)
      end
      if humanplayer1.life_points <= 0
        puts "T'es mort dans le game !"
      break
      end
    end
end

puts "*"*100
puts ""
puts "La partie est terminée."
if humanplayer1.life_points >= 1 then
  puts "Bravo tu as gagné une petite coupe de mousseux !"
else
  puts "T'es une sombre merde !"
end
