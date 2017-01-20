def translate(words)
  words = words.split(" ")
  capital = false
  punctuation = false
  results = []

  words.compact.each do |word|
    capital = word[0] == word[0].upcase ? true : false
    punctuation = word[-1] =~ /[?.!]/ ? true : false
    word.downcase!

    if punctuation
      punc = word[-1]
      word = piglatinize(word[0..-2])
      word += punc
    else
      word = piglatinize(word)
    end

    word = word.capitalize if capital
    results.push(word)
  end

  results.join(" ")
end

def piglatinize(word)
  word

  #find first vowel
  first_vowel = word =~ /[aeiou]/

  #takes care of exceptions, y, qu, Xqu
  if word[0] == 'y'
    word = word[1..-1] + word[0]
  elsif word[0..1] == 'qu'
    word = word[2..-1] + 'quay'
    return word
  elsif first_vowel != 0 && word[1..2] == 'qu'
    word = word[3..-1] + word[0..2] + 'ay'
    return word
  end

  #takes care of most words
  if first_vowel == 0
    word += "ay"
  else
    word = word[first_vowel..-1] + word[0..first_vowel-1] + "ay"
  end

  word
end

translate("apple")
translate("the Brown fox!")
