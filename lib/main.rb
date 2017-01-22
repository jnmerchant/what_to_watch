require 'csv'
require_relative 'movie'
require_relative 'rating'

def main
  movie_file = '../data/movie_sample_data.csv'
  rating_file = '../data/rating_sample_data.csv'

  movies = Movie.read_file(movie_file)
  ratings = Rating.read_file(rating_file)

  search_prompt
  search_input = gets.chomp

  matching_titles = Movie.search_titles(search_input, movies)
  Movie.display_matching_titles(matching_titles)

end

def search_prompt
  puts "Enter movie title to search: "
end



main if __FILE__ == $PROGRAM_NAME
