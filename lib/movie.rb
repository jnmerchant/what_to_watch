class Movie
  attr_reader :id, :title, :genre
  attr_accessor :ratings

  def initialize(id, title, genre)
    @id = id
    @title = title
    @genre = genre
    @ratings = []
  end

  def get_average_rating
    if @ratings.count == 0
      average_rating = 0
    else
      avg_rating = (@ratings.reduce(0, :+) / @ratings.count).round(1)
      average_rating = avg_rating
    end
  end

  def to_s
    "Title: #{@title} Genre: #{@genre} Average Rating: #{get_average_rating}"
  end

  def self.read_file(movie_file)
    movies = {}

    CSV.foreach(movie_file, {:headers => true }) do |movie|
      movie_id = movie[0].to_i
      movie_obj = Movie.new(movie[0].to_i, movie[1], movie[2])
      movies[movie_id] = movie_obj
    end
    movies
  end

  def self.search_titles(search_input, movies)
    matching_titles = {}

    movies.each do |id, movie|
      if movie.title.downcase.include? search_input.downcase
        matching_titles[movie.id] = movie
      end
    end
    matching_titles
  end

  def self.display_matching_titles(matching_search_titles)
    matching_search_titles.each do |id, movie|
      puts movie.to_s
    end
  end
end
