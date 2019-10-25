require "rails_helper"

RSpec.describe Movie, '.movies_made_by_same_director' do
    it 'finds movies made by the same director' do
        movie_1 = Movie.create(:title => "Jurassic Park", :director => "Steven Spielberg")
        movie_2 = Movie.create(:title => "Jurassic World", :director => "Steven Spielberg")

        result = movie_1.movies_made_by_same_director

        expect(result).to include(movie_2)
    end

    it 'does not find movies with different directors' do
        movie_1 = Movie.create(:title => "Jurassic Park", :director => "Steven Spielberg")
        movie_2 = Movie.create(:title => "Jurassic World", :director => "David Lynch")

        result = movie_1.movies_made_by_same_director

        expect(result).not_to include("Jurassic World")
    end
end 