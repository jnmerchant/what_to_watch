class Movie
  attr_reader :id, :title, :genre

  def initialize(id, title, genre)
    @id = id
    @title = title
    @genre = genre
    @average_rating = 0
    # @ratings = []
  end

  # def add_rating(rating)
  #   @ratings << rating
  # end

  def get_ratings(all_ratings)
    matching_ratings = []

    all_ratings.each do |rating_id, rating|
      if rating.movie_id == @id
        matching_ratings << rating.score
      end
    end

    matching_ratings
  end

  def get_average_rating(all_ratings)
    ratings = get_ratings(all_ratings)
    avg_rating = (ratings.reduce(0, :+) / ratings.count).round(1)
    @average_rating = avg_rating
  end

  def to_s
    "ID: #{@id} Title: #{@title} Genre: #{@genre} Average Rating: #{@average_rating}"
  end

  def self.read_file(movie_file)
    movies = {}

    CSV.foreach(movie_file, {:headers => true }) do |movie|
      movie_id = movie[0]
      movie_obj = Movie.new(movie[0].to_i, movie[1], movie[2])
      movies[movie_id] = movie_obj
    end
    movies
  end

  def self.search_titles(search_input, movies)
    matching_titles = []

    movies.each do |id, movie|
      if movie.title.downcase.include? search_input.downcase
        matching_titles << movie.title
      end
    end
    matching_titles
  end
end
