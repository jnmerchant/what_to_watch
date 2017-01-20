class Rating
  attr_reader :rating_id, :user_id, :movie_id, :score

  def initialize(rating_id, user_id, movie_id, score)
    @rating_id = rating_id
    @user_id = user_id
    @movie_id = movie_id
    @score = score
  end
end
