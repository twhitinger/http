class WordFind
  def initialize
    @dictionary = File.read("/usr/share/dict/words")
  end

  def find(word)
    @dictionary.include?(word) ? exists(word) : unknown(word)
  end

  def exists(word)
    "#{word.upcase} is a known word."
  end

  def unknown(word)
    "#{word.upcase} is not a known word."
  end
end
