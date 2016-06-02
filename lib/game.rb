class Game
  attr_reader :guess, :correct_number, :last_guess
  def initialize
    @count = 0
    @correct_number = generate_random_number
  end

  def guess_check(last_guess = 0)
    @count += 1
    last_guess = last_guess.to_i
    if last_guess > correct_number
      "too high."
    elsif last_guess < correct_number
      "too low."
    elsif last_guess == correct_number
      "Correct guess"
    end
  end

  def generate_random_number
    rand(1..100)
  end

end
