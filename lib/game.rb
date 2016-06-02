class Game
attr_reader :guess, :correct_number
  def initialize
    @count = 0
    @correct_number = generate_random_number

  end

  def guess_check(last_guess)
      @count += 1
    if last_guess > correct_number
      "Your guess is too high."
    elsif last_guess < correct_number
      "Your guess is too low."
    else
      @correct_number = generate_random_number
      "Your guess is correct."
    end

  end

  def generate_random_number
    rand(1..100)
  end

end
