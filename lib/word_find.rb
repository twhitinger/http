class WordFind
  def initialize
    @dictionary = File.read("/usr/share/dict/words")
  end

  def find(word)
    if @dictionary.include?(word)
      exists(word)
    else
      unknown(word)
    end
  end

  def exists(word)
   "#{word.upcase} is a known word."
  end

  def unknown(word)
    "#{word.upcase} is not a known word."
  end
end
