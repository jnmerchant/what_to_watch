require 'csv'
require_relative 'movie'
require_relative 'rating'

def main
  # movie_file = '../data/movie_sample_data.csv' #test file
  # rating_file = '../data/rating_sample_data.csv' #test file

  movie_file = '../data/movies.csv' #full file
  rating_file = '../data/ratings.csv' #full file

  movies = Movie.read_file(movie_file)
  ratings = Rating.read_file(rating_file, movies)

  loop do
    search_prompt
    search_input = gets.chomp
    if search_input == 'EXIT'
      break
    end
    matching_titles = Movie.search_titles(search_input, movies)
    Movie.display_matching_titles(matching_titles)
  end

end

def search_prompt
  puts "Enter movie title to search (enter 'EXIT' to end search): "
end

main if __FILE__ == $PROGRAM_NAME
