class WordFind
  def initialize
    @dictionary = File.read("/usr/share/dict/words")
  end
end
