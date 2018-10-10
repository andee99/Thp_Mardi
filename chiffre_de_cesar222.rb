def chiffrement_de_cesar(mot, shift = 3)
  alphabet_normal  = Array('a'..'z')
  alphabet_crypté  = Hash[alphabet_normal.zip(alphabet_normal.rotate(shift))]
  mot.chars.map { |c| alphabet_crypté.fetch(c, " ") }
end
puts "Entrez un mot à chiffrer: "
	x = gets.chomp
p chiffrement_de_cesar("#{x}").join