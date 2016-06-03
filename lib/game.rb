class Game
  attr_reader :guess, :correct_number, :last_guess, :count

  def initialize
    @count = 0
    @correct_number = generate_random_number
  end

  def summary
    string = "There has been #{@count} guess(es) and the last guess was #{last_guess}, which was"
    if @last_guess.nil?
      "Game Started, guess a number!"
    elsif last_guess.to_i == correct_number
      @count = 0
      @correct_number = generate_random_number
      string + " correct. Game reset guess again..."
    else
      last_guess.to_i > correct_number ? string  + " too high." : string  + " too low."
    end
  end

  def guess_check(last_guess)
    @count += 1
    @last_guess = last_guess.to_i
    last_guess = last_guess.to_i
    if last_guess > correct_number
      "Your guess is too high."
    elsif last_guess < correct_number
      "Your guess is too low."
    else last_guess == correct_number
      "You done guessed correct. Game restarted"
    end
  end

  def generate_random_number
    rand(1..100)
  end
end
