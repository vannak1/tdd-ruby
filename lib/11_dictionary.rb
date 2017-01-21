class Dictionary
  def initialize
    @entries = Hash.new
  end

  def entries
    @entries ||= {}
  end

  def add(arg)
    if arg.class == String
      entries[arg] = nil
    else
      arg.each do |k,v|
        entries[k] = v
      end
    end
  end

  def keywords
    @entries.keys.sort
  end

  def find(keyword)
    results = {}
    entries.each do |key, defin|
      results[key] = defin if key =~ /^#{keyword}/
    end

    results
  end

  def include?(keyword)
    @entries.has_key?(keyword)
  end

  def printable
    str = []

    entries.sort.each do |k, v|
      str << "[#{k}] \"#{v}\""
    end

    str.join("\n")
  end
end
