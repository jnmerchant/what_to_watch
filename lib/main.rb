require 'csv'
require_relative 'movie'
require_relative 'rating'

def main
  movie_file = '../data/movie_sample_data.csv'
  rating_file = '../data/rating_sample_data.csv'
  movies = read_movie_file(movie_file)
  # puts movies
  #
  ratings = read_rating_file(rating_file)
  # puts ratings

  matching_titles = search_titles('toy', movies)
  # puts matching_titles

  test_movie = Movie.new(1, "Toy Story", "Comedy")
  matching_ratings = test_movie.get_movie_rating(ratings)
  puts test_movie

end

def read_movie_file(movie_file)
  movies = {}

  CSV.foreach(movie_file, {:headers => true }) do |movie|
    movie_id = movie[0]
    movie_obj = Movie.new(movie[0].to_i, movie[1], movie[2])
    movies[movie_id] = movie_obj
  end
  movies
end

def read_rating_file(rating_file)
  ratings = {}
  rating_id = 1

  CSV.foreach(rating_file, {:headers => true}) do |rating|
    rating_obj = Rating.new(rating[0].to_i, rating[1].to_i, rating[2].to_f)
    ratings[rating_id] = rating_obj
    rating_id += 1
  end
  ratings
end

def search_titles(search_input, movies)
  matching_titles = []

  movies.each do |id, movie|
    if movie.title.downcase.include? search_input.downcase
      matching_titles << movie.title
    end
  end
  matching_titles
end

main if __FILE__ == $PROGRAM_NAME
