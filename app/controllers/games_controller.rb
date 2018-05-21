require 'word_checker'

class GamesController < ApplicationController
  def new
    @letters = []
    alphabet = ("A".."Z").to_a
    10.times { @letters << alphabet.sample }
    # binding.pry
  end

  def score
    @grid = params[:letters].split("")
    @answer = params[:answer]
    @wordchecker = WordChecker.new()
    @message = @wordchecker.check_word(@answer, @grid)
  end
end



