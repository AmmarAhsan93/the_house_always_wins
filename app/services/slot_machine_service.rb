# frozen_string_literal: true

class SlotMachineService
  SYMBOLS = {
    'C' => 10,
    'L' => 20,
    'O' => 30,
    'W' => 40
  }.freeze

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def roll
    result = []
    3.times { result << SYMBOLS.keys.sample }
    result = roll if winning_roll?(result) && should_reroll?

    [result, calculate_credits(result)]
  end

  private

  def winning_roll?(result)
    result.uniq.count == 1
  end

  def calculate_credits(result)
    if winning_roll?(result)
      SYMBOLS[result.first]
    else
      -1
    end
  end

  def should_reroll?
    credits = user.credits

    return false if credits < 40
    return true if credits > 60 && rand(1..100) <= 60
    return true if credits.between?(40, 60) && rand(1..100) <= 30

    false
  end
end
