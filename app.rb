require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Iris La Sanguinaire")
player2 = Player.new("Matthias Le Mercenaire")

puts "*"*100
puts ""
puts "\"Bienvenue dans notre nouveau jeu de combat sans merci, veuillez acclamer nos 2 joueurs !\"\n\n"
puts "*"*100
puts ""
puts "Suite à l'annonce, le public est en délire et crie pour accueuillir nos deux combattants.\n\n"
puts "*"*100
puts ""
puts "Le premier joueur s'avance est dit : \" Je suis #{player1.name} et je me battrais corps et âme pour la victoire!\""
puts "Au tour du second joueur de s'avancer, le torse bombé d'assurance :\"Je m'appelle #{player2.name} et rien n'y personne ne peut me vaincre !\""
puts ""
puts "Les deux joueurs ont respectivement :\n- #{player1.name} #{player1.life_points} points de vie.\n- Et #{player2.name} #{player2.life_points} points de vie également. \nLe combat va pouvoir commencer... Et parce que je l'ai décidé ce sera #{player2.name} qui commence suivi de #{player1.name} jusqu'à que l'un des deux soit tués dans d'attroce souffrance !"
puts "*"*100
puts ""

while player1.life_points > 0 && player2.life_points > 0 do 
    player2.attack(player1) 
    if player2.life_points <= 0
      puts "La partie est terminée nous avons un MORT :O !"
      break
    else 
      player1.attack(player2)
    if player1.life_points > 0 && player2.life_points > 0
      puts "Petit recap des points :\n#{player1.name} a #{player1.life_points} point(s)\n#{player2.name} a #{player2.life_points} points."
    end
  end
end

puts "*"*100
puts ""
puts "Ce fût un combat sans merci, nous remercions #{player1.name} et #{player2.name} pour leur participations, c'était MOR-TEL !"

