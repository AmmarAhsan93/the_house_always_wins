# frozen_string_literal: true

class SlotMachineService
  SYMBOLS = {
    'C' => 10,
    'L' => 20,
    'O' => 30,
    'W' => 40
  }.freeze
  
  def initialize(credits)
    @credits = credits
  end

  def roll
    result = []
    3.times { result << SYMBOLS.keys.sample }
    result = roll if winning_roll?(result) && should_reroll?

    [result, calculate_credits(result)]
  end

  private_constant :SYMBOLS

  private

  def winning_roll?(result)
    result.uniq.count == 1
  end

  def calculate_credits(result)
    return -1 unless winning_roll?(result)

    SYMBOLS[result.first]
  end

  def should_reroll?
    return false if @credits < 40
    return true if @credits > 60 && rand(1..100) <= 60
    return true if @credits.between?(40, 60) && rand(1..100) <= 30

    false
  end
end
