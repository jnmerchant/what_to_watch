require 'rating'

describe Rating do
  before do
    @rating_file = 'data/rating_sample_data.csv'
  end

  describe ' # new ' do
    context ' #creates a new rating object' do
      it 'creates a new rating object with an user id, movie id, rating' do
        rating = Rating.new(32, 34, 3.5)
        expect(rating.user_id).to eq 32
        expect(rating.score).to eq 3.5
      end
    end
  end

  describe ' #read_rating_file(rating_file) ' do
    context 'when given a file ' do
      it 'returns a hash of rating objects' do
        ratings = Rating.read_file(@rating_file)
        expect(ratings[1].user_id).to eq 1
      end
    end
  end

end
