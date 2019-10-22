require "rails_helper"

# RSpec.describe  Movie  do
#     describe '#same_director' do
#         context 'find all movies with the same director' do
#             let!(:movie1) { create(:movie, director: 'Dir1')}
#             let!(:movie2) { create(:movie, director: 'Dir1')}
#             let!(:movie3) { create(:movie, director: 'Dir3')}
            
#             subject {movie1.same_director}
#             it {expect(subject).to eq(movie2)}
#             it {expect(subject).not_to match(movie3)}
#         end
#     end
# end 

RSpec.describe Movie, '.movies_with_same_director' do
    it 'finds movies with the same director' do
        movie_1 = Movie.create(:title => "Totoro", :director => "Isaac Zhang")
        movie_2 = Movie.create(:title => "Inception", :director => "Isaac Zhang")

        result = movie_1.movies_with_same_director

        expect(result).to include("Inception")
    end

    it 'does not find movies with different directors' do
        movie_1 = Movie.create(:title => "Superman", :director => "Isaac Zhang")
        movie_2 = Movie.create(:title => "Batman", :director => "not Isaac Zhang")

        result = movie_1.movies_with_same_director

        expect(result).not_to include("Batman")
    end
end 