require 'rating'

describe Rating do
  describe ' # new ' do
    context ' #creates a new rating object' do
      it 'creates a new rating object with an user id, movie id, rating' do
      rating = Rating.new(32, 34, 3.5)
      expect(rating.user_id).to eq 32
      expect(rating.score).to eq 3.5
      end
    end
  end
end
