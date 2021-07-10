require 'pry'

class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

end

scores = [30, 50, 20, 70]
p HighScores.new(scores).scores
