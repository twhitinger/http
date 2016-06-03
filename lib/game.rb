class Game
  attr_reader :guess, :correct_number, :last_guess
  def initialize
    @count = 0
    @correct_number = generate_random_number
  end

  def summary
    string = "There have been #{@count} guesses and the last guess was #{last_guess}, which was"
    if @last_guess == nil
      "Game Started, guess a number!"
    elsif last_guess.to_i == correct_number
      string + " correct."
    else
      last_guess.to_i > correct_number ? string  + " too high." : string  + " too low."
    end
  end

  def guess_check(last_guess = 0)
    @count += 1
    @last_guess = last_guess.to_i
    last_guess = last_guess.to_i
    if last_guess > correct_number
      "Your guess is too high."
    elsif last_guess < correct_number
      "Your guess is too low."
    else last_guess == correct_number
      "You done guessed correct."
    end
  end

  def generate_random_number
    rand(1..100)
  end

end
