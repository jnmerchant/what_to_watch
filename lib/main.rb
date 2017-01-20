require 'csv'
require_relative 'movie'
require_relative 'rating'

def main
  movies = read_movie_file
  # puts movies
  #
  ratings = read_rating_file
  # puts ratings

  matching_titles = search_titles('toy', movies)
  # puts matching_titles

  matching_ratings = get_movie_rating(1, ratings)
  puts matching_ratings

end

def read_movie_file
  file = '../data/movie_sample_data.csv'
  movies = {}
  CSV.foreach(file, {:headers => true }) do |movie|
    movie_id = movie[0]
    movie_obj = Movie.new(movie[0].to_i, movie[1], movie[2])
    movies[movie_id] = movie_obj
  end
  movies
end

def read_rating_file
  file = '../data/rating_sample_data.csv'
  ratings = {}
  rating_id = 1
  CSV.foreach(file, {:headers => true}) do |rating|
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

def get_movie_rating(movie_id, ratings)
  matching_ratings = []

  ratings.each do |rating_id, rating|
    if rating.movie_id == movie_id
      matching_ratings << rating.score
    end
  end
  matching_ratings
end





main if __FILE__ == $PROGRAM_NAME
