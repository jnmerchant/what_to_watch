require 'movie'

describe Movie do
  movie = Movie.new(1, 'Toy Story', 'Comedy')
  ratings = 

  describe ' # new ' do
    context ' #creates a new movie object' do
      it 'creates a new movie object with an id, title, and genre' do

      expect(movie.title).to eq 'Toy Story'
      expect(movie.id).to eq 1
      end
    end
  end

  describe '#get_movie_rating' do
    context 'when passed a hash of rating objects' do
      it 'gets an array of all ratings for movie and returns an average rating' do

        expect(movie.get_movie_rating(ratings))
      end
    end
  end

  describe ' # calculate_average_rating ' do
    context 'when passed an array of movie ratings' do
      it 'returns the average' do
        matching_ratings = [2.0, 2.5, 5]
        expect(movie.calculate_average_rating(matching_ratings)). to eq 3.2
      end
    end
  end

end
