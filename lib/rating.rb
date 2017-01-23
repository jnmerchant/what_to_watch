class Rating
  attr_reader :user_id, :movie_id, :score

  def initialize(user_id, movie_id, score)
    @user_id = user_id
    @movie_id = movie_id
    @score = score
  end

  def self.read_file(rating_file, movies)
    ratings = {}
    rating_id = 1

    CSV.foreach(rating_file, {:headers => true}) do |rating|
      rating_obj = Rating.new(rating[0].to_i, rating[1].to_i, rating[2].to_f)
      ratings[rating_id] = rating_obj
      rating_id += 1
    end
    assign_rating_to_movie(ratings, movies)
    ratings
  end

  def self.assign_rating_to_movie(ratings, movies)
    ratings.each do |id, rating|
      if movies.include? rating.movie_id
        movies[rating.movie_id].ratings << rating.score
      end
    end
  end
end
