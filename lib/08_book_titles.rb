class Book
  def title
    @title
  end

  def title=(title)
    @title = titleize(title)
  end

  def titleize(title)
    list_of_exclusion = ["the", "a", "an", "and", "in", "of"]

    words = title.split(" ")
    results = words.collect do |word|
      if list_of_exclusion.include?(word)
        word
      else
        word.capitalize
      end
    end

    #handles exceptions being first word
    results[0].capitalize!

    results.join(" ")
  end
end
