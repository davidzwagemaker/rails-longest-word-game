class WordChecker
  def check_dictionary?(answer)
    url = "https://wagon-dictionary.herokuapp.com/#{answer}"
    serialized_api_result = RestClient.get(url)
    parsed_api_result = JSON.parse(serialized_api_result)
    parsed_api_result["found"]
  end

  def check_grid?(answer, grid)
  answer.upcase.chars.all? { |letter| answer.count(letter) <= grid.count(letter) }
  end

  def check_word(answer, grid)
    grid_check = check_grid?(answer, grid)
    dictionary_check = check_dictionary?(answer)
    return "Sorry, #{answer.capitalize} can not be made with these letters" if grid_check == false
    return "Sorry, #{answer.capitalize} is not an English word" if dictionary_check == false
    return "Congratulations! #{answer.capitalize} is a valid English word" if grid_check && dictionary_check
  end
end
