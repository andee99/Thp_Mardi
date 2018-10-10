corpus = "Howdy partner, sit down! How's it going?"
dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]


def jean_michel_data(corpus, dictionary)

  repetition = {}
  lettre = corpus.downcase.split(/[^a-z]+/)


  dictionary.each do |reference|
    lettre.each do |word|
      if word == reference 
        if repetition.has_key? reference
          word[reference] +=1
        else
          repetition[word] = 1
        end
      end
    end
  end

  repetition.each do |word, nbFois|
    puts "Le mot #{word} est présent #{nbFois} fois. "
  end
end

jean_michel_data(corpus, dictionary)