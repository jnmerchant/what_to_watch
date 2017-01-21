require 'csv'
require_relative 'movie'
require_relative 'rating'

def main
  movie_file = '../data/movie_sample_data.csv'
  rating_file = '../data/rating_sample_data.csv'

  movies = Movie.read_file(movie_file)
  # puts movies
  ratings = Rating.read_file(rating_file)
  # puts ratings
  matching_titles = Movie.search_titles('toy', movies)
  # puts matching_titles
  test_movie = Movie.new(1, "Toy Story", "Comedy")
  matching_ratings = test_movie.get_average_rating(ratings)
  puts test_movie

end

main if __FILE__ == $PROGRAM_NAME
