def echo(phrase)
  phrase
end

def shout(phrase)
  phrase.upcase
end

def repeat(phrase, time = 2)
  str = ""
  (time).times {str << (" #{phrase}")}
  str.strip
end

def start_of_word(word, num_of_letters)
  word[0, num_of_letters]
end

def first_word(words)
  words.split(" ")[0]
end

def titleize(title)
  titles = title.split(" ")
  conjunction = ["and", "but", "over", "the"]
  titles.each_with_index do |title, i|
    title.capitalize! if i == 0
    title.capitalize! unless conjunction.include?(title.downcase)
  end

  titles.join(" ")
end
