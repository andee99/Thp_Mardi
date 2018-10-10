def chiffrement_de_cesar(mot, shift = 3)
  alphabet = Array('a'..'z')
  crypté = Hash[alphabet.zip(alphabet.rotate(shift))]
  mot.chars.map { |c| crypté.fetch(c, " ") }
end
puts "Entrez un mot à chiffrer: "
	x = gets.chomp
p chiffrement_de_cesar("#{x}").join